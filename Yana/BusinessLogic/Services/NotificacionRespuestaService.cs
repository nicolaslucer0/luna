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
    public class NotificacionRespuestaService : INotificacionRespuestaService
    {
        private readonly NotificacionRespuestaRepository notificacionRespuestaRepository;

        public NotificacionRespuestaService()
        {
            this.notificacionRespuestaRepository = new NotificacionRespuestaRepository();
        }

        public List<NotificacionRespuesta> GetAll()
        {
            return this.notificacionRespuestaRepository.GetAll();
        }

        public NotificacionRespuesta GetById(int id)
        {
            return this.notificacionRespuestaRepository.Get(id);
        }

        public int Insert(NotificacionRespuesta entity)
        {
            return this.notificacionRespuestaRepository.Insert(entity);
        }

        public void Update(NotificacionRespuesta entity)
        {
            this.notificacionRespuestaRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.notificacionRespuestaRepository.Delete(id);
        }

        #region NotImplementedMembers


        #endregion

    }
}
