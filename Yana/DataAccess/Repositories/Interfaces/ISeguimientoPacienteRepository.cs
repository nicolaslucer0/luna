using System.Collections.Generic;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories.Interfaces
{
    public interface ISeguimientoPacienteRepository<T> : IBaseRepository<SeguimientoPaciente>
    {
        List<SeguimientoPaciente> GetByIdPaciente(int idPaciente);
    }
}
