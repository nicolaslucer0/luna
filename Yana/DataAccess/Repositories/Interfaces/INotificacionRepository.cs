using System.Collections.Generic;
using Yana.Enums;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories.Interfaces
{
    public interface INotificacionRepository<T> : IBaseRepository<Notificacion>
    {
        IEnumerable<Notificacion> GetAllByProfesionalAndPaciente(int idProfesional, int idPaciente);
        List<Notificacion> GetByPacienteYEstados(int idPaciente, List<EnumEstadoNotificacion> estadosNotificaciones);
        IEnumerable<Notificacion> GetAllByProfesional(int idProfesional);
        Notificacion GetWithFK(int idNotificacion);
        void UpdateStatus(int idNotificacion, EnumEstadoNotificacion estadoNotificacion);
        List<Notificacion> GetByEstados(List<EnumEstadoNotificacion> estadosNotificaciones);
        int GetTotalNotificaciones();
    }
}
