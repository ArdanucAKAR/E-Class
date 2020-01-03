using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Class.Panel.Teacher
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlParameter[] spParameter = new SqlParameter[1];
            Database.ProcedureName = "dbo.GetSubjects";

            spParameter[0] = new SqlParameter("@lessonID", SqlDbType.Int);
            if (HttpContext.Current.Request.Cookies["User"] != null)
                spParameter[0].Value = Convert.ToInt32(HttpContext.Current.Request.Cookies["User"]["branchID"]);
            else
                spParameter[0].Value = 0;

            DataSet ds = Database.Queries(spParameter);

            if (!IsPostBack)
            {
                ddlSubject.Items.Clear();
                if (ds.Tables[0].Rows.Count != 0)
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        ddlSubject.Items.Insert(0, new ListItem(ds.Tables[0].Rows[i]["subject"].ToString(), ds.Tables[0].Rows[i]["subjectID"].ToString()));


                ddlAnswer.Items.Clear();
                ddlAnswer.Items.Insert(0, new ListItem("A", "A"));
                ddlAnswer.Items.Insert(1, new ListItem("B", "B"));
                ddlAnswer.Items.Insert(2, new ListItem("C", "C"));
                ddlAnswer.Items.Insert(3, new ListItem("D", "D"));
            }
        }

        protected void btnQuestion_Click(object sender, EventArgs e)
        {
            int questionID = AddQuestion();

            if (questionID != 1)
            {
                AddChoice(questionID, "A", txtA, fuA, (ddlAnswer.SelectedItem.Value == "A" ? true : false));
                AddChoice(questionID, "B", txtB, fuB, (ddlAnswer.SelectedItem.Value == "B" ? true : false));
                AddChoice(questionID, "C", txtC, fuC, (ddlAnswer.SelectedItem.Value == "C" ? true : false));
                AddChoice(questionID, "D", txtD, fuD, (ddlAnswer.SelectedItem.Value == "D" ? true : false));
                Response.Redirect(Request.RawUrl);
            }
            else
                lblMessage.Text = "Hata Oluştu";
        }

        public int AddQuestion()
        {
            SqlParameter[] spParameter = new SqlParameter[4];
            Database.ProcedureName = "dbo.AddQuestion";
            string fileName = Guid.NewGuid().ToString();
            int questionID = -1;

            spParameter[0] = new SqlParameter("@question", SqlDbType.NVarChar, -1);
            spParameter[0].Value = txtQuestion.InnerText;

            if (fuQuestion.HasFile)
            {
                if (fuQuestion.PostedFile.ContentType == "image/jpeg" || fuQuestion.PostedFile.ContentType == "image/png")
                {
                    if (fuQuestion.PostedFile.ContentLength < 1024000)
                        fuQuestion.SaveAs(Server.MapPath("~/images/") + fileName + ".jpeg");
                    else
                        lblMessage.Text += "Dosya boyutu maximum 1MB olmalıdır.";
                }
                else
                    lblMessage.Text = " Sadece jpeg uzantılı dosyalar yüklenebilir.";
            }
            spParameter[1] = new SqlParameter("@path", SqlDbType.NVarChar, -1);
            spParameter[1].Value = fuQuestion.HasFile == true ? fileName + ".jpeg" : "";

            spParameter[2] = new SqlParameter("@lessonID", SqlDbType.Int);
            spParameter[2].Value = Convert.ToInt32(HttpContext.Current.Request.Cookies["User"]["branchID"]);

            spParameter[3] = new SqlParameter("@subjectID", SqlDbType.Int);
            spParameter[3].Value = Convert.ToInt32(ddlSubject.SelectedItem.Value);

            DataSet ds = Database.Queries(spParameter);

            if (ds.Tables[0].Rows.Count == 1)
                questionID = Convert.ToInt32(ds.Tables[0].Rows[0]["questionID"]);

            txtQuestion.InnerText = string.Empty;
            return questionID;
        }

        public void AddChoice(int questionID, string letter, TextBox context, FileUpload file, bool answer)
        {
            SqlParameter[] spParameter = new SqlParameter[5];
            Database.ProcedureName = "dbo.AddChoice";
            string fileName = Guid.NewGuid().ToString();

            spParameter[0] = new SqlParameter("@questionID", SqlDbType.Int);
            spParameter[0].Value = questionID;

            spParameter[1] = new SqlParameter("@letter", SqlDbType.NVarChar, -1);
            spParameter[1].Value = letter;

            spParameter[2] = new SqlParameter("@context", SqlDbType.NVarChar, -1);
            spParameter[2].Value = context.Text;

            if (file.HasFile)
            {
                if (file.PostedFile.ContentType == "image/jpeg" || file.PostedFile.ContentType == "image/png")
                {
                    if (file.PostedFile.ContentLength < 1024000)
                        file.SaveAs(Server.MapPath("~/images/") + fileName + ".jpeg");
                    else
                        lblMessage.Text += "Dosya boyutu maximum 1MB olmalıdır.";
                }
                else
                    lblMessage.Text = " Sadece jpeg uzantılı dosyalar yüklenebilir.";
            }
            spParameter[3] = new SqlParameter("@path", SqlDbType.NVarChar, -1);
            spParameter[3].Value = file.HasFile == true ? fileName + ".jpeg" : "";

            spParameter[4] = new SqlParameter("@answer", SqlDbType.Bit);
            spParameter[4].Value = answer == false ? 0 : 1;

            context.Text = string.Empty;
            Database.Queries(spParameter);
        }
    }
}