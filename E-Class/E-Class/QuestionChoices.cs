//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace E_Class
{
    using System;
    using System.Collections.Generic;
    
    public partial class QuestionChoices
    {
        public int questionID { get; set; }
        public int choiceID { get; set; }
        public Nullable<bool> answer { get; set; }
    
        public virtual Choices Choices { get; set; }
        public virtual Questions Questions { get; set; }
    }
}