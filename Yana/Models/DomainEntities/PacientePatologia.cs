using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class PacientePatologia
    {
        public int IdPacientePatologia { get; set; }
        public int? IdPaciente { get; set; }
        public int? IdPatologia { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Usuario IdPacienteNavigation { get; set; }
        public virtual Patologia IdPatologiaNavigation { get; set; }
    }
}
