using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Class
{
    public class Question
    {
        public int ID { get; set; }
        public string _Question { get; set; }
        public string Path { get; set; }
        public string LessonID { get; set; }
        public string SubjectID { get; set; }
    }
}