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
    public class DomicilioUsuarioService : IDomicilioUsuarioService
    {
        private readonly DomicilioUsuarioRepository domicilioUsuarioRepository;

        public DomicilioUsuarioService()
        {
            this.domicilioUsuarioRepository = new DomicilioUsuarioRepository();
        }

        public List<DomicilioUsuario> GetAll()
        {
            return this.domicilioUsuarioRepository.GetAll();
        }

        public DomicilioUsuario GetById(int id)
        {
            return this.domicilioUsuarioRepository.Get(id);
        }

        public int Insert(DomicilioUsuario entity)
        {
            return this.domicilioUsuarioRepository.Insert(entity);
        }

        public void Update(DomicilioUsuario entity)
        {
            this.domicilioUsuarioRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.domicilioUsuarioRepository.Delete(id);
        }

        public List<DomicilioUsuario> GetAllById(int id)
        {
            throw new NotImplementedException();
        }

        #region NotImplementedMembers


        #endregion

    }
}
