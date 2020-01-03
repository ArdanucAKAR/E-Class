using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Class
{
    public partial class Dash : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (AuthenticationService.isLoggedIn() == null)
                Response.Redirect("~/index.aspx");
        }
    }
}