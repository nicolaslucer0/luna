using System.Collections.Generic;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.DataAccess.Repositories;
using Yana.Models.DomainEntities;

namespace Yana.BusinessLogic.Services
{
    public class UsuarioInstitucionService : IUsuarioInstitucionService
    {
        private readonly UsuarioInstitucionRepository usuarioInstitucionRepository;

        public UsuarioInstitucionService()
        {
            this.usuarioInstitucionRepository = new UsuarioInstitucionRepository();
        }

        public List<UsuarioInstitucion> GetAll()
        {
            return this.usuarioInstitucionRepository.GetAll();
        }

        public UsuarioInstitucion GetById(int id)
        {
            return this.usuarioInstitucionRepository.Get(id);
        }

        public int Insert(UsuarioInstitucion entity)
        {
            return this.usuarioInstitucionRepository.Insert(entity);
        }

        public void Update(UsuarioInstitucion entity)
        {
            this.usuarioInstitucionRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.usuarioInstitucionRepository.Delete(id);
        }

        public List<UsuarioInstitucion> GetAllById(int id)
        {
            throw new System.NotImplementedException();
        }

        #region NotImplementedMembers


        #endregion

    }
}
