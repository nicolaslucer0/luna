using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class TipoDomicilio
    {
        public TipoDomicilio()
        {
            DomicilioUsuario = new HashSet<DomicilioUsuario>();
        }

        public int IdTipoDomicilio { get; set; }
        public string Descripcion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual ICollection<DomicilioUsuario> DomicilioUsuario { get; set; }
    }
}
