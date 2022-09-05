using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class SeguimientoPaciente
    {
        public int IdSeguimientoPaciente { get; set; }
        public int? IdProfesional { get; set; }
        public int? IdPaciente { get; set; }
        public string Nota { get; set; }
        public DateTime? FechaAlta { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Usuario IdPacienteNavigation { get; set; }
        public virtual Usuario IdProfesionalNavigation { get; set; }
    }
}
