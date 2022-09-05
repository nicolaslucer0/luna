using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class Patologia
    {
        public Patologia()
        {
            PacientePatologia = new HashSet<PacientePatologia>();
            PatologiaGrupoPatologia = new HashSet<PatologiaGrupoPatologia>();
        }

        public int IdPatologia { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual ICollection<PacientePatologia> PacientePatologia { get; set; }
        public virtual ICollection<PatologiaGrupoPatologia> PatologiaGrupoPatologia { get; set; }
    }
}
