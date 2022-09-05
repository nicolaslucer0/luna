using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Yana.BusinessLogic.Services.Interfaces
{
    public interface IBaseService<T> : IGetterService<T>
    {
        int Insert(T entity);
        void Update(T entity);
        void Delete(int id);
    }
}
