using System.ComponentModel.DataAnnotations.Schema;

namespace Yana.Models.DomainEntities
{
    public partial class RegistroDiarioRespuesta
    {
        [NotMapped]
        public int IdPaciente { get; set; }
    }
}
