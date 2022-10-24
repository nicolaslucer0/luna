using System;
using System.Collections.Generic;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories.Interfaces
{
    public interface IPatologiaRepository<T> : IGetterRepository<Patologia>
    {
        List<Patologia> GetByIdPaciente(int idPaciente);
    }
}
