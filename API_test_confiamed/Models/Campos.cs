using System.ComponentModel.DataAnnotations;

namespace API_test_confiamed.Models
{
    public class Campos
    {
        [Key]
        public int IdCampos { get; set; }
        public required int IdFormulario { get; set; }
        public required string NombreCampo { get; set; }
        public required string TipoDatoCampo { get; set; }
        public required int LongitudCampo { get; set; }
        public required int OrdenCampo { get; set; }

        public required int EstadoCampo { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime? FechaModificacion { get; set; }
        public Formularios? Formulario { get; set; }
    }
}
