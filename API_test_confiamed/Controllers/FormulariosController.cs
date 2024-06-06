using API_test_confiamed.Models; 
using Microsoft.AspNetCore.Mvc; 
using Microsoft.EntityFrameworkCore; 
namespace API_test_confiamed.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FormulariosController : ControllerBase
    {
        private readonly AppDbContext _context;

        public FormulariosController(AppDbContext context)
        {
            _context = context;
        }
         
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Formularios>>> GetFormularios()
        {
            return await _context.Formularios.ToListAsync();
        }
         
        [HttpGet("{id}")]
        public async Task<ActionResult<Formularios>> GetFormulario(int id)
        {
            var form = await _context.Formularios.FirstOrDefaultAsync(f => f.IdFormulario == id);

            if (form == null)
            {
                return NotFound();
            }

            return form;
        }
         
        [HttpPost]
        public async Task<ActionResult<Formularios>> PostForm(Formularios form)
        {
            _context.Formularios.Add(form);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetFormulario), new { id = form.IdFormulario }, form);
        }
         
        [HttpPut("{id}")]
        public async Task<IActionResult> PutForm(int id, Formularios form)
        {
            if (id != form.IdFormulario)
            {
                return BadRequest();
            }

            _context.Entry(form).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FormExists(id))
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
        public async Task<IActionResult> DeleteForm(int id)
        {
            var form = await _context.Formularios.FindAsync(id);
            if (form == null)
            {
                return NotFound();
            }

            _context.Formularios.Remove(form);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool FormExists(int id)
        {
            return _context.Formularios.Any(e => e.IdFormulario == id);
        }
    }
}
