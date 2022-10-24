using System.Collections.Generic;
using Yana.Enums;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;

namespace Yana.BusinessLogic.Services.Interfaces
{
    public interface INotificacionService : IBaseService<Notificacion>
    {
        IEnumerable<Notificacion> GetNotificacionesProfesionalAndPaciente(int idProfesional, int idPaciente);
        void InsertNotificaciones(List<Notificacion> notificaciones, List<NotificacionOpcionWrapper> listaOpciones);
        List<Notificacion> BuildNotificaciones(NotificacionWrapper notificacionWrapper);
        NotificacionWrapper GetNotificacionWrapperById(int idNotificacion);
        void UpdateNotificaciones(NotificacionWrapper notificacion);
        Usuario GetPacienteById(int idPaciente);
        bool ValidarNotificaciones(NotificacionWrapper notificacion);
        List<Notificacion> GetByPacienteYEstados(int idPaciente, List<EnumEstadoNotificacion> estadosNotificaciones);
        IEnumerable<Notificacion> GetNotificacionesProfesional(int idUsuario);
        List<Notificacion> BuildNotificacionesStandar(NotificacionWrapper notificacion);
        Notificacion GetWithFK(int idNotificacion);
        void UpdateStatus(int idNotificacion, EnumEstadoNotificacion estadoNotificacion);
        List<Notificacion> GetByEstados(List<EnumEstadoNotificacion> estadosNotificaciones);
        int GetTotalNotificaciones();
        int CountNotificationsByProfesionalAndStatus(int idProfesional, int estado);
    }
}
