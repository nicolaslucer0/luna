using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;

namespace Yana.BusinessLogic.Services.Interfaces
{
    public interface IPacientePatologiaService : IBaseService<PacientePatologia>
    {
        void SaveOrUpdateByPaciente(Usuario paciente);
    }
}
