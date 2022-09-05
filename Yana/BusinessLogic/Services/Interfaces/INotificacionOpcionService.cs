using System.Collections.Generic;
using Yana.Models.DomainEntities;

namespace Yana.BusinessLogic.Services.Interfaces
{
    public interface INotificacionOpcionService : IBaseService<NotificacionOpcion>
    {
        List<NotificacionOpcion> GetByIdNotificacion(int idNotificacion);
    }
}
