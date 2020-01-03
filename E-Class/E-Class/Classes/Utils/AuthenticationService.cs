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
                    Cookie["ID"] = Singleton.GetInstance().User.ID.ToString();
                    Cookie["Email"] = Singleton.GetInstance().User.Email.ToString();
                    Cookie["Password"] = Singleton.GetInstance().User.Password.ToString();
                    Cookie["Fullname"] = Singleton.GetInstance().User.Fullname.ToString();
                    Cookie["type"] = "Student";
                }
                else
                {
                    Singleton.GetInstance().User = new Teacher()
                    {
                        ID = Convert.ToInt32(ds.Tables[0].Rows[0]["userID"]),
                        Email = user.Email,
                        Password = user.Password,
                        Fullname = ds.Tables[0].Rows[0]["fullname"].ToString(),
                        BranchID = Convert.ToInt32(ds.Tables[0].Rows[0]["branchID"].ToString())
                    };
                    Cookie["ID"] = Singleton.GetInstance().User.ID.ToString();
                    Cookie["Email"] = Singleton.GetInstance().User.Email.ToString();
                    Cookie["Password"] = Singleton.GetInstance().User.Password.ToString();
                    Cookie["Fullname"] = Singleton.GetInstance().User.Fullname.ToString();
                    Cookie["type"] = "Teacher";
                }

                HttpContext.Current.Response.Cookies.Add(Cookie);
                return Singleton.GetInstance().User;
            }
            else
                return null;
        }

        public static User Register(User user)
        {
            SqlParameter[] spParameter = new SqlParameter[2];

            Database.ProcedureName = "dbo.Register";
            spParameter[0] = new SqlParameter("@email", SqlDbType.NVarChar, -1);
            spParameter[0].Value = user.Email;

            spParameter[1] = new SqlParameter("@password", SqlDbType.NVarChar, -1);
            spParameter[1].Value = user.Password;

            DataSet ds = Database.Queries(spParameter);

            if (ds.Tables[0].Rows.Count == 1)
            {
                HttpCookie Cookie = null;
                if (HttpContext.Current.Response.Cookies["User"] != null)
                    Cookie = HttpContext.Current.Response.Cookies["User"];
                else
                    Cookie = new HttpCookie("User");
                Cookie.Expires = DateTime.Now.AddDays(3);

                Singleton.GetInstance().User = new Student()
                {
                    ID = Convert.ToInt32(ds.Tables[0].Rows[0]["userID"]),
                    Email = user.Email,
                    Password = user.Password,
                    Fullname = ds.Tables[0].Rows[0]["fullname"].ToString()
                };
                Cookie["ID"] = Singleton.GetInstance().User.ID.ToString();
                Cookie["Email"] = Singleton.GetInstance().User.Email.ToString();
                Cookie["Password"] = Singleton.GetInstance().User.Password.ToString();
                Cookie["Fullname"] = Singleton.GetInstance().User.Fullname.ToString();
                Cookie["type"] = "Student";

                HttpContext.Current.Response.Cookies.Add(Cookie);
                return Singleton.GetInstance().User;
            }
            else
                return null;
        }

        public static Result Results(List<QuestionAnswer> questionAnswers)
        {
            SqlParameter[] spParameter = new SqlParameter[3];

            Database.ProcedureName = "dbo.UpdateTestQuestion";

            foreach (var item in questionAnswers)
            {
                spParameter[0] = new SqlParameter("@testID", SqlDbType.Int);
                spParameter[0].Value = item.TestID; 
                
                spParameter[1] = new SqlParameter("@questionID", SqlDbType.Int);
                spParameter[1].Value = item.QuestionID;

                spParameter[2] = new SqlParameter("@choice", SqlDbType.NVarChar, 1);
                spParameter[2].Value = item.Choice;

                Database.Queries(spParameter);
            }

            if (questionAnswers.Count != 0)
            {
                Database.ProcedureName = "dbo.TestResults";
                spParameter = new SqlParameter[1];
                spParameter[0] = new SqlParameter("@testID", SqlDbType.Int);
                spParameter[0].Value = questionAnswers[0].TestID;

                Result result = new Result();
                DataSet ds = Database.Queries(spParameter);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    result.FalseCount = Convert.ToInt32(ds.Tables[0].Rows[0]["FalseCount"]);
                    result.TrueCount = Convert.ToInt32(ds.Tables[0].Rows[0]["TrueCount"]);
                }
                return result;
            }
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