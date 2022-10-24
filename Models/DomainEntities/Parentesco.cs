using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class Parentesco
    {
        public Parentesco()
        {
            GrupoFamiliar = new HashSet<GrupoFamiliar>();
        }

        public int IdParentesco { get; set; }
        public string Descripcion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual ICollection<GrupoFamiliar> GrupoFamiliar { get; set; }
    }
}
