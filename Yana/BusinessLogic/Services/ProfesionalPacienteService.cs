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
    public class ProfesionalPacienteService : IProfesionalPacienteService
    {
        private readonly ProfesionalPacienteRepository profesionalPacienteRepository;

        public ProfesionalPacienteService()
        {
            this.profesionalPacienteRepository = new ProfesionalPacienteRepository();
        }

        public List<ProfesionalPaciente> GetAll()
        {
            return this.profesionalPacienteRepository.GetAll();
        }

        public ProfesionalPaciente GetById(int id)
        {
            return this.profesionalPacienteRepository.Get(id);
        }

        public int Insert(ProfesionalPaciente entity)
        {
            return this.profesionalPacienteRepository.Insert(entity);
        }

        public void Update(ProfesionalPaciente entity)
        {
            this.profesionalPacienteRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.profesionalPacienteRepository.Delete(id);
        }

        public List<ProfesionalPaciente> GetAllById(int id)
        {
            throw new NotImplementedException();
        }

        #region NotImplementedMembers


        #endregion

    }
}
