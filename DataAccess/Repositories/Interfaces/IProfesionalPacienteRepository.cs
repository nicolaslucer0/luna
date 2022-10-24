using System;
using System.Collections.Generic;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories.Interfaces
{
    public interface IProfesionalPacienteRepository<T> : IBaseRepository<ProfesionalPaciente>
    {
        List<ProfesionalPaciente> GetPacientesByProfesional(int idProfesional);
        List<ProfesionalPaciente> GetPacientesByIdsProfesionales(List<int> idsProfesionales);
    }
}
