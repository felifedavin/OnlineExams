using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace OnlineExams.Models
{
    public class TestForms
    {
        public long ID { get; set; }

        [ForeignKey("Categories")]
        public int CategoryID { get; set; }
        public string FormTitle { get; set; }
        public string FormDescription { get; set; }
        public string VisibilityType { get; set; }
        public string VisibilityValue { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifyDate { get; set; }
        public string ModifyBy { get; set; }
    }
}
