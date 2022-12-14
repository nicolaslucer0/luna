using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class EstadoProfesionalPaciente
    {
        public EstadoProfesionalPaciente()
        {
            ProfesionalPaciente = new HashSet<ProfesionalPaciente>();
        }

        public int IdEstadoProfesionalPaciente { get; set; }
        public string Descripcion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual ICollection<ProfesionalPaciente> ProfesionalPaciente { get; set; }
    }
}
