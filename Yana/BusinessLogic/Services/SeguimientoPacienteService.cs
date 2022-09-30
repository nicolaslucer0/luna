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
    public class SeguimientoPacienteService : ISeguimientoPacienteService
    {
        private readonly SeguimientoPacienteRepository seguimientoPacienteRepository;

        public SeguimientoPacienteService()
        {
            this.seguimientoPacienteRepository = new SeguimientoPacienteRepository();
        }

        public List<SeguimientoPaciente> GetAll()
        {
            return this.seguimientoPacienteRepository.GetAll();
        }

        public SeguimientoPaciente GetById(int id)
        {
            return this.seguimientoPacienteRepository.Get(id);
        }

        public int Insert(SeguimientoPaciente entity)
        {
            return this.seguimientoPacienteRepository.Insert(entity);
        }

        public void Update(SeguimientoPaciente entity)
        {
            this.seguimientoPacienteRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.seguimientoPacienteRepository.Delete(id);
        }

        public List<SeguimientoPaciente> GetByIdPaciente(int idPaciente)
        {
            return this.seguimientoPacienteRepository.GetByIdPaciente(idPaciente);
        }

        public List<SeguimientoPaciente> GetAllById(int id)
        {
            throw new NotImplementedException();
        }

        #region NotImplementedMembers


        #endregion
    }
}
