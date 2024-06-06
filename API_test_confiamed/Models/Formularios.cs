using System.ComponentModel.DataAnnotations;

namespace API_test_confiamed.Models
{
    public class Formularios
    {
        [Key]
        public int IdFormulario { get; set; }
        public required string NombreFormulario { get; set; }
        public required int EstadoFormulario { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime? FechaModificacion { get; set; }

        public ICollection<Campos>? Campo { get; set; }

    }
}
