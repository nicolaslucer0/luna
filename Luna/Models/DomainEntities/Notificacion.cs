using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class Notificacion
    {
        public Notificacion()
        {
            NotificacionOpcion = new HashSet<NotificacionOpcion>();
            NotificacionRespuesta = new HashSet<NotificacionRespuesta>();
        }

        public int IdNotificacion { get; set; }
        public int? IdProfesional { get; set; }
        public int? IdPaciente { get; set; }
        public string Mensaje { get; set; }
        public DateTime? FechaHora { get; set; }
        public int? IdEstadoNotificacion { get; set; }
        public int? IdGrupoNotificacion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }
        public bool EsTipoEstadoEmocional { get; set; }

        public virtual EstadoNotificacion IdEstadoNotificacionNavigation { get; set; }
        public virtual GrupoNotificacion IdGrupoNotificacionNavigation { get; set; }
        public virtual Usuario IdPacienteNavigation { get; set; }
        public virtual Usuario IdProfesionalNavigation { get; set; }
        public virtual ICollection<NotificacionOpcion> NotificacionOpcion { get; set; }
        public virtual ICollection<NotificacionRespuesta> NotificacionRespuesta { get; set; }
    }
}
