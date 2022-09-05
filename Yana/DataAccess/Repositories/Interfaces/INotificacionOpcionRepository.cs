using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories.Interfaces
{
    public interface INotificacionOpcionRepository<T> : IBaseRepository<NotificacionOpcion>
    {
        List<NotificacionOpcion> GetByIdNotificacion(int idNotificacion);
    }
}
