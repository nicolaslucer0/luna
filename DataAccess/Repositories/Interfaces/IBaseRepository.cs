
namespace Yana.DataAccess.Repositories.Interfaces
{
    public interface IBaseRepository<T> : IGetterRepository<T>
    {
        int Insert(T entity);
        void Update(T entity);
        void Delete(int id);
    }
}
