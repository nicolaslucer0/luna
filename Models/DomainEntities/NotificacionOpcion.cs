using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class NotificacionOpcion
    {
        public NotificacionOpcion()
        {
            NotificacionRespuesta = new HashSet<NotificacionRespuesta>();
        }

        public int IdNotificacionOpcion { get; set; }
        public int? IdNotificacion { get; set; }
        public string Descripcion { get; set; }
        public int? Orden { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Notificacion IdNotificacionNavigation { get; set; }
        public virtual ICollection<NotificacionRespuesta> NotificacionRespuesta { get; set; }
    }
}
