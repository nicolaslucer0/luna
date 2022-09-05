using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class PatologiaGrupoPatologia
    {
        public int IdPatologiaGrupoPatologia { get; set; }
        public int? IdPatologia { get; set; }
        public int? IdGrupoPatologia { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual GrupoPatologia IdGrupoPatologiaNavigation { get; set; }
        public virtual Patologia IdPatologiaNavigation { get; set; }
    }
}
