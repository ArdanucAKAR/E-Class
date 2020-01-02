using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace E_Class.WebService
{
    /// <summary>
    /// Summary description for AuthenticationServiceAPI
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class AuthenticationServiceAPI : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = true)]
        public Teacher TeacherLogin(Teacher teacher)
        {
            return (Teacher)AuthenticationService.Login(teacher);
        }

        [WebMethod(EnableSession = true)]
        public Student StudentLogin(Student student)
        {
            return (Student)AuthenticationService.Login(student);
        }
        
        [WebMethod(EnableSession = true)]
        public void Logout()
        {
            AuthenticationService.Logout();
        }
    }
}
