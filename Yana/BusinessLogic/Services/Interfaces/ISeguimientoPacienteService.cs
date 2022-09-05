using System.Collections.Generic;
using Yana.Models.DomainEntities;

namespace Yana.BusinessLogic.Services.Interfaces
{
    public interface ISeguimientoPacienteService : IBaseService<SeguimientoPaciente>
    {
        List<SeguimientoPaciente> GetByIdPaciente(int idPaciente);
    }
}
