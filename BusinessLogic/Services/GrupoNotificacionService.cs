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
    public class GrupoNotificacionService : IGrupoNotificacionService
    {
        private readonly GrupoNotificacionRepository grupoNotificacionRepository;

        public GrupoNotificacionService()
        {
            this.grupoNotificacionRepository = new GrupoNotificacionRepository();
        }

        public List<GrupoNotificacion> GetAll()
        {
            return this.grupoNotificacionRepository.GetAll();
        }

        public GrupoNotificacion GetById(int id)
        {
            return this.grupoNotificacionRepository.Get(id);
        }

        public int Insert(GrupoNotificacion entity)
        {
            return this.grupoNotificacionRepository.Insert(entity);
        }

        public void Update(GrupoNotificacion entity)
        {
            this.grupoNotificacionRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.grupoNotificacionRepository.Delete(id);
        }

        public List<GrupoNotificacion> GetAllById(int id)
        {
            throw new NotImplementedException();
        }

        #region NotImplementedMembers


        #endregion

    }
}
