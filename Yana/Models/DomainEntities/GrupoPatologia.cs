using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class GrupoPatologia
    {
        public GrupoPatologia()
        {
            PatologiaGrupoPatologia = new HashSet<PatologiaGrupoPatologia>();
        }

        public int IdGrupoPatologia { get; set; }
        public string Descripcion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual ICollection<PatologiaGrupoPatologia> PatologiaGrupoPatologia { get; set; }
    }
}
