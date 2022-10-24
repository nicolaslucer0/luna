using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories.Interfaces
{
    public interface IRegistroDiarioRepository<T> : IBaseRepository<RegistroDiario>
    {
        int GetTotalRegistrosDiarios();
    }
}
