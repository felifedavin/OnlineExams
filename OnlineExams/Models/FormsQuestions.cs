using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace OnlineExams.Models
{
    public class FormsQuestions
    {
        public long ID { get; set; }

        [ForeignKey("TestForms")]
        public long FormID { get; set;}
        public string QuestionText { get; set; }
        public string QuestionDesc { get; set; }
        public string AnswerType { get; set; }
        public long AnswerIdRandomUnique { get; set; }
        public string URL{ get; set; }
        public bool RequiredAnswer { get; set; }
        public string VisibilityType { get; set; }
        public string VisibilityValue { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifyDate { get; set; }
        public string ModifyBy { get; set; }
    }
}
