using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Class.Panel
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] array = {"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sit amet nisl ut odio maximus auctor id et ante. Nullam eu aliquet risus. Vestibulum dui massa, accumsan ornare lacinia a, tristique in nisi. Donec et risus placerat velit blandit luctus. Nulla condimentum vehicula malesuada. Nunc laoreet elit nisl. Sed porta nec libero et viverra. Nullam nibh nisl, molestie non sollicitudin ut, laoreet ac sem. Sed placerat metus nec mauris sodales ultricies.", "b", "c", "a", "b", "c" , "a", "b", "c" , "d"};
            repQuestions.DataSource = array;
            repQuestions.DataBind();

        }
    }
}