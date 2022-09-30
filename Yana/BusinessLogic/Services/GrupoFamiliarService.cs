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
    public class GrupoFamiliarService : IGrupoFamiliarService
    {
        private readonly GrupoFamiliarRepository grupoFamiliarRepository;

        public GrupoFamiliarService()
        {
            this.grupoFamiliarRepository = new GrupoFamiliarRepository();
        }

        public List<GrupoFamiliar> GetAll()
        {
            return this.grupoFamiliarRepository.GetAll();
        }

        public GrupoFamiliar GetById(int id)
        {
            return this.grupoFamiliarRepository.Get(id);
        }

        public int Insert(GrupoFamiliar entity)
        {
            return this.grupoFamiliarRepository.Insert(entity);
        }

        public void Update(GrupoFamiliar entity)
        {
            this.grupoFamiliarRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.grupoFamiliarRepository.Delete(id);
        }

        public List<GrupoFamiliar> GetAllById(int id)
        {
            throw new NotImplementedException();
        }

        #region NotImplementedMembers


        #endregion

    }
}
