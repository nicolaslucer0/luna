using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.DataAccess.Repositories;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;

namespace Yana.BusinessLogic.Services
{
    public class NotificacionOpcionService : INotificacionOpcionService
    {
        private readonly NotificacionOpcionRepository notificacionOpcionRepository;

        public NotificacionOpcionService()
        {
            this.notificacionOpcionRepository = new NotificacionOpcionRepository();
        }

        public List<NotificacionOpcion> GetAll()
        {
            return this.notificacionOpcionRepository.GetAll();
        }

        public NotificacionOpcion GetById(int id)
        {
            return this.notificacionOpcionRepository.Get(id);
        }

        public int Insert(NotificacionOpcion entity)
        {
            return this.notificacionOpcionRepository.Insert(entity);
        }

        public void Update(NotificacionOpcion entity)
        {
            this.notificacionOpcionRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.notificacionOpcionRepository.Delete(id);
        }

        public List<NotificacionOpcion> GetByIdNotificacion(int idNotificacion)
        {
            return this.notificacionOpcionRepository.GetByIdNotificacion(idNotificacion);
        }

        #region NotImplementedMembers


        #endregion

        public List<NotificacionOpcion> GetOpcionesStandar()
        {
            List<NotificacionOpcion> opciones = new List<NotificacionOpcion>()
            {
                new NotificacionOpcion()
                {
                    IdNotificacionOpcion = 1,
                    Descripcion = "Bien"
                },
                new NotificacionOpcion()
                {
                    IdNotificacionOpcion = 2,
                    Descripcion = "Regular"
                },
                new NotificacionOpcion()
                {
                    IdNotificacionOpcion = 3,
                    Descripcion = "Mal"
                },
            };

            return opciones;
        }

        public List<NotificacionOpcion> GetAllById(int id)
        {
            throw new NotImplementedException();
        }
    }
}
