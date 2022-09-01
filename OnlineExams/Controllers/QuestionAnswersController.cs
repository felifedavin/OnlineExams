using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineExams.Data;
using OnlineExams.Models;

namespace OnlineExams.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionAnswersController : ControllerBase
    {
        private readonly OnlineExamsContext _context;

        public QuestionAnswersController(OnlineExamsContext context)
        {
            _context = context;
        }

        // GET: api/QuestionAnswers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<QuestionAnswers>>> GetQuestionAnswers()
        {
            return await _context.QuestionAnswers.ToListAsync();
        }

        // GET: api/QuestionAnswers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<QuestionAnswers>> GetQuestionAnswers(long id)
        {
            var questionAnswers = await _context.QuestionAnswers.FindAsync(id);

            if (questionAnswers == null)
            {
                return NotFound();
            }

            return questionAnswers;
        }

        // PUT: api/QuestionAnswers/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutQuestionAnswers(long id, QuestionAnswers questionAnswers)
        {
            if (id != questionAnswers.ID)
            {
                return BadRequest();
            }

            _context.Entry(questionAnswers).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!QuestionAnswersExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/QuestionAnswers
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<QuestionAnswers>> PostQuestionAnswers(QuestionAnswers questionAnswers)
        {
            _context.QuestionAnswers.Add(questionAnswers);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetQuestionAnswers", new { id = questionAnswers.ID }, questionAnswers);
        }

        // DELETE: api/QuestionAnswers/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<QuestionAnswers>> DeleteQuestionAnswers(long id)
        {
            var questionAnswers = await _context.QuestionAnswers.FindAsync(id);
            if (questionAnswers == null)
            {
                return NotFound();
            }

            _context.QuestionAnswers.Remove(questionAnswers);
            await _context.SaveChangesAsync();

            return questionAnswers;
        }

        private bool QuestionAnswersExists(long id)
        {
            return _context.QuestionAnswers.Any(e => e.ID == id);
        }
    }
}
