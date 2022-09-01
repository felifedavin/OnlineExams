using System.ComponentModel.DataAnnotations.Schema;

namespace OnlineExams.Models
{
    public class QuestionAnswers
    {
        public long ID { get; set; }

        [ForeignKey("FormsQuestions")]
        public long AnswerIdRandomUnique { get; set; }
        public string AnswerText { get; set; }
        public bool isCorrect { get; set; }
    }
}
