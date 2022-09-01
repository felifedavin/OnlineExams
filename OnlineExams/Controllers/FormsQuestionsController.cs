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
    public class FormsQuestionsController : ControllerBase
    {
        private readonly OnlineExamsContext _context;

        public FormsQuestionsController(OnlineExamsContext context)
        {
            _context = context;
        }

        // GET: api/FormsQuestions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<FormsQuestions>>> GetFormsQuestions()
        {
            return await _context.FormsQuestions.ToListAsync();
        }

        // GET: api/FormsQuestions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<FormsQuestions>> GetFormsQuestions(long id)
        {
            var formsQuestions = await _context.FormsQuestions.FindAsync(id);

            if (formsQuestions == null)
            {
                return NotFound();
            }

            return formsQuestions;
        }

        // PUT: api/FormsQuestions/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutFormsQuestions(long id, FormsQuestions formsQuestions)
        {
            if (id != formsQuestions.ID)
            {
                return BadRequest();
            }

            _context.Entry(formsQuestions).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FormsQuestionsExists(id))
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

        // POST: api/FormsQuestions
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<FormsQuestions>> PostFormsQuestions(FormsQuestions formsQuestions)
        {
            _context.FormsQuestions.Add(formsQuestions);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetFormsQuestions", new { id = formsQuestions.ID }, formsQuestions);
        }

        // DELETE: api/FormsQuestions/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<FormsQuestions>> DeleteFormsQuestions(long id)
        {
            var formsQuestions = await _context.FormsQuestions.FindAsync(id);
            if (formsQuestions == null)
            {
                return NotFound();
            }

            _context.FormsQuestions.Remove(formsQuestions);
            await _context.SaveChangesAsync();

            return formsQuestions;
        }

        private bool FormsQuestionsExists(long id)
        {
            return _context.FormsQuestions.Any(e => e.ID == id);
        }
    }
}
