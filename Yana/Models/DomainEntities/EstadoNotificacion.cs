using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class EstadoNotificacion
    {
        public EstadoNotificacion()
        {
            Notificacion = new HashSet<Notificacion>();
        }

        public int IdEstadoNotificacion { get; set; }
        public string Descripcion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual ICollection<Notificacion> Notificacion { get; set; }
    }
}
