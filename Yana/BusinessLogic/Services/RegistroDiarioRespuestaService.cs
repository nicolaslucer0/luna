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
    public class RegistroDiarioRespuestaService : IRegistroDiarioRespuestaService
    {
        private readonly RegistroDiarioRespuestaRepository registroDiarioRespuestaRepository;

        public RegistroDiarioRespuestaService()
        {
            this.registroDiarioRespuestaRepository = new RegistroDiarioRespuestaRepository();
        }

        public List<RegistroDiarioRespuesta> GetAll()
        {
            return this.registroDiarioRespuestaRepository.GetAll();
        }

        public RegistroDiarioRespuesta GetById(int id)
        {
            return this.registroDiarioRespuestaRepository.Get(id);
        }

        public int Insert(RegistroDiarioRespuesta entity)
        {
            return this.registroDiarioRespuestaRepository.Insert(entity);
        }

        public void Update(RegistroDiarioRespuesta entity)
        {
            this.registroDiarioRespuestaRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.registroDiarioRespuestaRepository.Delete(id);
        }

        #region NotImplementedMembers


        #endregion

    }
}
