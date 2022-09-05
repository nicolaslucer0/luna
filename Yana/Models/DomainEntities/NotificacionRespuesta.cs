using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class NotificacionRespuesta
    {
        public int IdNotificacionRespuesta { get; set; }
        public int? IdNotificacion { get; set; }
        public int? IdNotificacionOpcion { get; set; }
        public string Respuesta { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Notificacion IdNotificacionNavigation { get; set; }
        public virtual NotificacionOpcion IdNotificacionOpcionNavigation { get; set; }
    }
}
