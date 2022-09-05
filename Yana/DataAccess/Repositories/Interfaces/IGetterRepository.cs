using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Yana.DataAccess.Repositories.Interfaces
{
    public interface IGetterRepository<T>
    {
        List<T> GetAll();
        T Get(int id);
    }
}
