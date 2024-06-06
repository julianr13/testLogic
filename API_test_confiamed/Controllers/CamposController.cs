using API_test_confiamed.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API_test_confiamed.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CamposController : ControllerBase
    {
        
        private readonly AppDbContext _context;

        public CamposController(AppDbContext context)
        {
            _context = context;
        }
         
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Campos>>> GetInputs()
        {
            return await _context.Campos.ToListAsync();
        }
         
        [HttpGet("{id}")]
        public async Task<ActionResult<IEnumerable<Campos>>> GetInput(int id)
        {
            var input = await _context.Campos
                .Where(i => i.IdCampos == id)
                .ToListAsync();

            if (input == null)
            {
                return NotFound();
            }

            return input;
        }
        [HttpGet("Formulario/{id}")]
        public async Task<ActionResult<IEnumerable<Campos>>> GetxFormulario(int id)
        {
            var input = await _context.Campos
                .Where(i => i.IdFormulario == id)
                .ToListAsync();

            if (input == null)
            {
                return NotFound();
            }

            return input;
        }
         
        [HttpPost]
        public async Task<ActionResult<Campos>> PostInput(Campos input)
        {
            _context.Campos.Add(input);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetInput), new { id = input.IdCampos }, input);
        }
         
        [HttpPut("{id}")]
        public async Task<IActionResult> PutInput(int id, Campos input)
        {
            if (id != input.IdCampos)
            {
                return BadRequest();
            }

            _context.Entry(input).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InputExists(id))
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
         
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInput(int id)
        {
            var input = await _context.Campos.FindAsync(id);
            if (input == null)
            {
                return NotFound();
            }

            _context.Campos.Remove(input);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InputExists(int id)
        {
            return _context.Campos.Any(e => e.IdCampos == id);
        }
    }
}
