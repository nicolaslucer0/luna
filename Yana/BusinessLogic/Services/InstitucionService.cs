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
    public class InstitucionService : IInstitucionService
    {
        private readonly InstitucionRepository institucionRepository;

        public InstitucionService()
        {
            this.institucionRepository = new InstitucionRepository();
        }

        public List<Institucion> GetAll()
        {
            return this.institucionRepository.GetAll();
        }

        public Institucion GetById(int id)
        {
            return this.institucionRepository.Get(id);
        }

        public int Insert(Institucion entity)
        {
            return this.institucionRepository.Insert(entity);
        }

        public void Update(Institucion entity)
        {
            this.institucionRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.institucionRepository.Delete(id);
        }

        #region NotImplementedMembers


        #endregion

    }
}
