using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using OnlineExams.Models;

namespace OnlineExams.Data
{
    public class OnlineExamsContext : DbContext
    {
        public OnlineExamsContext (DbContextOptions<OnlineExamsContext> options)
            : base(options)
        {
        }

        public DbSet<OnlineExams.Models.TestForms> TestForms { get; set; }

        public DbSet<OnlineExams.Models.FormsQuestions> FormsQuestions { get; set; }

        public DbSet<OnlineExams.Models.QuestionAnswers> QuestionAnswers { get; set; }

        public DbSet<OnlineExams.Models.Categories> Categories { get; set; }
    }
}
