using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class ProfesionalPaciente
    {
        public int IdProfesionalPaciente { get; set; }
        public int? IdProfesional { get; set; }
        public int? IdPaciente { get; set; }
        public int? IdEstadoProfesionalPaciente { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual EstadoProfesionalPaciente IdEstadoProfesionalPacienteNavigation { get; set; }
        public virtual Usuario IdPacienteNavigation { get; set; }
        public virtual Usuario IdProfesionalNavigation { get; set; }
    }
}
