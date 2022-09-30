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
    public class ProfesionalInstitucionService : IProfesionalInstitucionService
    {
        private readonly ProfesionalInstitucionRepository profesionalInstitucionRepository;

        public ProfesionalInstitucionService()
        {
            this.profesionalInstitucionRepository = new ProfesionalInstitucionRepository();
        }

        public List<ProfesionalInstitucion> GetAll()
        {
            return this.profesionalInstitucionRepository.GetAll();
        }

        public ProfesionalInstitucion GetById(int id)
        {
            return this.profesionalInstitucionRepository.Get(id);
        }

        public int Insert(ProfesionalInstitucion entity)
        {
            return this.profesionalInstitucionRepository.Insert(entity);
        }

        public void Update(ProfesionalInstitucion entity)
        {
            this.profesionalInstitucionRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.profesionalInstitucionRepository.Delete(id);
        }

        public List<ProfesionalInstitucion> GetAllById(int id)
        {
            throw new NotImplementedException();
        }

        #region NotImplementedMembers


        #endregion

    }
}
