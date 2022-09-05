using System.Collections.Generic;

namespace Yana.BusinessLogic.Services.Interfaces
{
    public interface IGetterService<T>
    {
        List<T> GetAll();
        T GetById(int id);
    }
}
