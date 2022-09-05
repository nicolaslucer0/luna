using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class TipoEmocion
    {
        public TipoEmocion()
        {
            RegistroDiarioIdTipoEmocionNavigation = new HashSet<RegistroDiario>();
            RegistroDiarioIdTipoEmocionResultadoNavigation = new HashSet<RegistroDiario>();
        }

        public int IdTipoEmocion { get; set; }
        public string Descripcion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual ICollection<RegistroDiario> RegistroDiarioIdTipoEmocionNavigation { get; set; }
        public virtual ICollection<RegistroDiario> RegistroDiarioIdTipoEmocionResultadoNavigation { get; set; }
    }
}
