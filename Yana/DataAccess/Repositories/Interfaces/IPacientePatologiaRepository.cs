using System.Collections.Generic;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories.Interfaces
{
    public interface IPacientePatologiaRepository<T> : IBaseRepository<PacientePatologia>
    {
        List<PacientePatologia> GetByIdPaciente(int idPaciente);
        void DeleteByPatologiaYPaciente(int idPatologia, int idPaciente);
        void DeleteByIdPaciente(int idPaciente);
    }
}
