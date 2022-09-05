using System.Collections.Generic;
using System.Linq;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.DataAccess.Repositories;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;

namespace Yana.BusinessLogic.Services
{
    public class PacientePatologiaService : IPacientePatologiaService
    {
        private readonly PacientePatologiaRepository PacientePatologiaRepository;

        public PacientePatologiaService()
        {
            this.PacientePatologiaRepository = new PacientePatologiaRepository();
        }

        public List<PacientePatologia> GetAll()
        {
            return this.PacientePatologiaRepository.GetAll();
        }

        public PacientePatologia GetById(int id)
        {
            return this.PacientePatologiaRepository.Get(id);
        }

        public int Insert(PacientePatologia entity)
        {
            return this.PacientePatologiaRepository.Insert(entity);
        }

        public void Update(PacientePatologia entity)
        {
            this.PacientePatologiaRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.PacientePatologiaRepository.Delete(id);
        }

        public void SaveOrUpdateByPaciente(Usuario paciente)
        {
            List<Patologia> pacientePatologiasExistentes = this.PacientePatologiaRepository.GetByIdPaciente(paciente.IdUsuario).Select(x => x.IdPatologiaNavigation).Where(x => !x.BajaLogica).ToList();

            if (paciente.ListPatologia != null && paciente.ListPatologia.Any())
            {
                foreach (Patologia patologiaExistente in pacientePatologiasExistentes)
                {
                    PatologiaPacienteWrapper patologiaEliminar = paciente.ListPatologia.FirstOrDefault(x => x.idPatologia == patologiaExistente.IdPatologia);

                    if (patologiaEliminar == null)
                        this.PacientePatologiaRepository.DeleteByPatologiaYPaciente(patologiaExistente.IdPatologia, paciente.IdUsuario);
                }

                foreach (PatologiaPacienteWrapper patologia in paciente.ListPatologia)
                {
                    Patologia patologiaExistente = pacientePatologiasExistentes.FirstOrDefault(x => x.IdPatologia == patologia.idPatologia);

                    if (patologiaExistente == null)
                    {
                        this.PacientePatologiaRepository.Insert(new PacientePatologia
                        {
                            IdPaciente = paciente.IdUsuario,
                            IdPatologia = patologia.idPatologia
                        });
                    }
                }
            }
            else
            {
                if (pacientePatologiasExistentes.Any())
                    this.PacientePatologiaRepository.DeleteByIdPaciente(paciente.IdUsuario);
            }
        }

        #region NotImplementedMembers


        #endregion

    }
}
