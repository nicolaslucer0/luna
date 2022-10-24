using System.Collections.Generic;

namespace Yana.BusinessLogic.Services.Interfaces
{
    public interface IGetterService<T>
    {
        List<T> GetAll();
        List<T> GetAllById(int id);
        T GetById(int id);
    }
}
