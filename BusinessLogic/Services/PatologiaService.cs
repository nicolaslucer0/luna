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
    public class PatologiaService : IPatologiaService
    {
        private readonly PatologiaRepository patologiaRepository;

        public PatologiaService()
        {
            this.patologiaRepository = new PatologiaRepository();
        }

        public List<Patologia> GetAll()
        {
            return this.patologiaRepository.GetAll();
        }

        public Patologia GetById(int id)
        {
            return this.patologiaRepository.Get(id);
        }

        public int Insert(Patologia entity)
        {
            return this.patologiaRepository.Insert(entity);
        }

        public void Update(Patologia entity)
        {
            this.patologiaRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.patologiaRepository.Delete(id);
        }

        public List<Patologia> GetByIdPaciente(int idPaciente)
        {
            return this.patologiaRepository.GetByIdPaciente(idPaciente);
        }

        public List<Patologia> GetAllById(int id)
        {
            throw new NotImplementedException();
        }

        #region NotImplementedMembers


        #endregion
    }
}
