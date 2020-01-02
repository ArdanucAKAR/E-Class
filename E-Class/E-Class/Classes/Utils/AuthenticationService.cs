using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace E_Class
{
    public class AuthenticationService
    {
        public static User Login(User user)
        {
            SqlParameter[] spParameter = new SqlParameter[3];

            Database.ProcedureName = "dbo.CheckUser";
            spParameter[0] = new SqlParameter("@email", SqlDbType.NVarChar, -1);
            spParameter[0].Value = user.Email;

            spParameter[1] = new SqlParameter("@password", SqlDbType.NVarChar, -1);
            spParameter[1].Value = user.Password;

            spParameter[2] = new SqlParameter("@type", SqlDbType.NVarChar, -1);
            spParameter[2].Value = (user is Student) ? "Student" : "Teacher";

            DataSet ds = Database.Queries(spParameter);

            if (ds.Tables[0].Rows.Count == 1)
            {
                HttpCookie Cookie = null;
                if (HttpContext.Current.Response.Cookies["User"] != null)
                    Cookie = HttpContext.Current.Response.Cookies["User"];
                else
                    Cookie = new HttpCookie("User");
                Cookie.Expires = DateTime.Now.AddDays(3);

                if (user is Student)
                {
                    Singleton.GetInstance().User = new Student()
                    {
                        ID = Convert.ToInt32(ds.Tables[0].Rows[0]["userID"]),
                        Email = user.Email,
                        Password = user.Password,
                        Fullname = ds.Tables[0].Rows[0]["fullname"].ToString()
                    };
                    Cookie["User"] = Singleton.GetInstance().User.ToString();
                }
                else
                {
                    Singleton.GetInstance().User = new Teacher()
                    {
                        ID = Convert.ToInt32(ds.Tables[0].Rows[0]["userID"]),
                        Username = user.Username,
                        Password = user.Password,
                        Fullname = ds.Tables[0].Rows[0]["fullname"].ToString(),
                        BranchID = Convert.ToInt32(ds.Tables[0].Rows[0]["branchID"].ToString())
                    };
                    Cookie["User"] = Singleton.GetInstance().User.ToString();
                }

                HttpContext.Current.Response.Cookies.Add(Cookie);
                return Singleton.GetInstance().User;
            }
            else
                return null;
        }

        public static HttpCookie isLoggedIn()
        {
            if (HttpContext.Current.Request.Cookies["User"] != null)
                return HttpContext.Current.Request.Cookies["User"];
            else
                return null;
        }

        public static void Logout()
        {
            Singleton.Destroy();

            if (HttpContext.Current.Request.Cookies["User"] != null)
                HttpContext.Current.Response.Cookies["User"].Expires = DateTime.Now.AddDays(-1);
        }
    }
}