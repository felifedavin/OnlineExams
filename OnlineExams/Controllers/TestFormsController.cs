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
    public class TestFormsController : ControllerBase
    {
        private readonly OnlineExamsContext _context;

        public TestFormsController(OnlineExamsContext context)
        {
            _context = context;
        }

        // GET: api/TestForms
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TestForms>>> GetTestForms()
        {
            return await _context.TestForms.ToListAsync();
        }

        // GET: api/TestForms/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TestForms>> GetTestForms(long id)
        {
            var testForms = await _context.TestForms.FindAsync(id);

            if (testForms == null)
            {
                return NotFound();
            }

            return testForms;
        }

        // PUT: api/TestForms/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTestForms(long id, TestForms testForms)
        {
            if (id != testForms.ID)
            {
                return BadRequest();
            }

            _context.Entry(testForms).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TestFormsExists(id))
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

        // POST: api/TestForms
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<TestForms>> PostTestForms(TestForms testForms)
        {
            _context.TestForms.Add(testForms);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTestForms", new { id = testForms.ID }, testForms);
        }

        // DELETE: api/TestForms/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<TestForms>> DeleteTestForms(long id)
        {
            var testForms = await _context.TestForms.FindAsync(id);
            if (testForms == null)
            {
                return NotFound();
            }

            _context.TestForms.Remove(testForms);
            await _context.SaveChangesAsync();

            return testForms;
        }

        private bool TestFormsExists(long id)
        {
            return _context.TestForms.Any(e => e.ID == id);
        }

       
        [HttpGet]
        [Route("getall")]
        public async Task<dynamic> GetAll()
        {
            var temp = await _context.TestForms
            .Select(x => new
            {
                x.ID,
                x.FormTitle,
                x.FormDescription,
                x.VisibilityType,
                x.VisibilityValue,
                x.CreatedDate,
                x.CreatedBy,
                QuestionList = _context.FormsQuestions.Where(y=>y.FormID == x.ID).Select(c => new { 
                    c.ID,
                    c.FormID,
                    c.QuestionText,
                    c.QuestionDesc,
                    c.VisibilityType,
                    c.VisibilityValue,
                    c.CreatedDate,
                    c.CreatedBy,
                    AnswerList = _context.QuestionAnswers.Where(z => z.AnswerIdRandomUnique == c.AnswerIdRandomUnique).Select(p => new
                    {
                        p.ID,
                        p.AnswerText,
                        p.isCorrect

                    }).ToList(),
                }).ToList(),
            }).ToListAsync();

            return temp;
        }
    }
}
