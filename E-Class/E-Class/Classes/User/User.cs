using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Class
{
    [Serializable]
    public abstract class User
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Fullname { get; set; }
        public int SchoolID { get; set; }
    }
}