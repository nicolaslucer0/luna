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
    public class RegistroDiarioService : IRegistroDiarioService
    {
        private readonly RegistroDiarioRepository registroDiarioRepository;

        public RegistroDiarioService()
        {
            this.registroDiarioRepository = new RegistroDiarioRepository();
        }

        public List<RegistroDiario> GetAll()
        {
            return this.registroDiarioRepository.GetAll();
        }

        public RegistroDiario GetById(int id)
        {
            return this.registroDiarioRepository.Get(id);
        }

        public int Insert(RegistroDiario entity)
        {
            return this.registroDiarioRepository.Insert(entity);
        }

        public void Update(RegistroDiario entity)
        {
            this.registroDiarioRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.registroDiarioRepository.Delete(id);
        }

        public int GetTotalRegistrosDiarios()
        {
            return this.registroDiarioRepository.GetTotalRegistrosDiarios();
        }

        public List<RegistroDiario> GetAllById(int id)
        {
            return this.registroDiarioRepository.GetAllById(id);
        }

        #region NotImplementedMembers


        #endregion

    }
}
