using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Class.panel.Student
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Database.ProcedureName = "dbo.GetTests";
            SqlParameter[] spParameter = new SqlParameter[1];

            spParameter[0] = new SqlParameter("@studentID", SqlDbType.Int);
            if (HttpContext.Current.Request.Cookies["User"] != null)
                spParameter[0].Value = Convert.ToInt32(HttpContext.Current.Request.Cookies["User"]["ID"]);
            else
                spParameter[0].Value = 0;

            DataSet ds = Database.Queries(spParameter);

            if (!IsPostBack)
            {
                if (ds.Tables[0].Rows.Count != 0)
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        ddlTest.Items.Insert(i, new ListItem(ds.Tables[0].Rows[i]["date"].ToString(), ds.Tables[0].Rows[i]["testID"].ToString()));
            }
        }
    }
}