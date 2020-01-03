    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Class
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (AuthenticationService.isLoggedIn() != null)
            {
                if (HttpContext.Current.Request.Cookies["User"]["type"] == "Student")
                    Response.Redirect("~/Panel/Student/index.aspx");
                else
                    Response.Redirect("~/Panel/Teacher/index.aspx");
            }           
        }
    }
}