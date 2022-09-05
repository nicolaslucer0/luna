using System.Collections.Generic;
using Yana.Models.DomainEntities;

namespace Yana.BusinessLogic.Services.Interfaces
{
    public interface IPatologiaService : IBaseService<Patologia>
    {
        List<Patologia> GetByIdPaciente(int idPaciente);
    }
}
