using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Class.Panel.Student
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database.ProcedureName = "dbo.GetLessons";

            DataSet ds = Database.Queries(null);

            if (!IsPostBack)
            {
                if (ds.Tables[0].Rows.Count == 1)
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        ddlLessons.Items.Insert(0, new ListItem(ds.Tables[0].Rows[i]["lesson"].ToString(), ds.Tables[0].Rows[i]["lessonID"].ToString()));
            }
        }

        protected void btnCreateTest_Click(object sender, EventArgs e)
        {
            int testID = 0;
            SqlParameter[] spParameter = new SqlParameter[2];
            Database.ProcedureName = "dbo.CreateTest";

            spParameter[0] = new SqlParameter("@studentID", SqlDbType.Int);
            if (HttpContext.Current.Request.Cookies["User"] != null)
                spParameter[0].Value = Convert.ToInt32(HttpContext.Current.Request.Cookies["User"]["ID"]);
            else
                spParameter[0].Value = 0;

            spParameter[1] = new SqlParameter("@lessonID", SqlDbType.Int);
            spParameter[1].Value = ddlLessons.SelectedItem.Value;

            DataSet ds = Database.Queries(spParameter);

            if (ds.Tables[0].Rows.Count == 1)
                testID = Convert.ToInt32(ds.Tables[0].Rows[0]["testID"]);

            Database.ProcedureName = "dbo.PrepareTest";
            spParameter = new SqlParameter[3];

            spParameter[0] = new SqlParameter("@studentID", SqlDbType.Int);
            if (HttpContext.Current.Request.Cookies["User"] != null)
                spParameter[0].Value = Convert.ToInt32(HttpContext.Current.Request.Cookies["User"]["ID"]);
            else
                spParameter[0].Value = 0;

            spParameter[1] = new SqlParameter("@lessonID", SqlDbType.Int);
            spParameter[1].Value = ddlLessons.SelectedItem.Value;

            spParameter[2] = new SqlParameter("@testID", SqlDbType.Int);
            spParameter[2].Value = testID;

            ds = Database.Queries(spParameter);

            if (ds.Tables[0].Rows.Count != 1)
            {
                List<Test> test = new List<Test>();
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    test.Add(new Test()
                    {
                        TestID = Convert.ToInt32(ds.Tables[0].Rows[i]["testID"]),
                        QuestionID = Convert.ToInt32(ds.Tables[0].Rows[i]["questionID"]),
                        Question = ds.Tables[0].Rows[i]["question"].ToString(),
                        QuestionPath = ds.Tables[0].Rows[i]["questionPath"].ToString(),
                        A = ds.Tables[0].Rows[i]["A"].ToString(),
                        APath = ds.Tables[0].Rows[i]["APath"].ToString(),
                        B = ds.Tables[0].Rows[i]["B"].ToString(),
                        BPath = ds.Tables[0].Rows[i]["BPath"].ToString(),
                        C = ds.Tables[0].Rows[i]["C"].ToString(),
                        CPath = ds.Tables[0].Rows[i]["CPath"].ToString(),
                        D = ds.Tables[0].Rows[i]["D"].ToString(),
                        DPath = ds.Tables[0].Rows[i]["DPath"].ToString(),
                        Answer = ds.Tables[0].Rows[i]["cevap"].ToString()
                    });
                }
                repQuestions.DataSource = test;
                repQuestions.DataBind();
            }
        }
    }
}