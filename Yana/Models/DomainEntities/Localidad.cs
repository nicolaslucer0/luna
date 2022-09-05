using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class Localidad
    {
        public Localidad()
        {
            DomicilioUsuario = new HashSet<DomicilioUsuario>();
        }

        public int IdLocalidad { get; set; }
        public string Descripcion { get; set; }
        public int IdProvincia { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Provincia IdProvinciaNavigation { get; set; }
        public virtual ICollection<DomicilioUsuario> DomicilioUsuario { get; set; }
    }
}
