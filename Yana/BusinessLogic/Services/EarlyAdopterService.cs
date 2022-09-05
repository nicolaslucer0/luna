using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.DataAccess.Repositories;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;

namespace Yana.BusinessLogic.Services
{
    public class EarlyAdopterService : IEarlyAdopterService
    {
        private readonly EarlyAdopterRepository earlyAdopterRepository;

        public EarlyAdopterService()
        {
            this.earlyAdopterRepository = new EarlyAdopterRepository();
        }

        public List<EarlyAdopter> GetAll()
        {
            return this.earlyAdopterRepository.GetAll();
        }

        public EarlyAdopter GetById(int id)
        {
            return this.earlyAdopterRepository.Get(id);
        }

        public int Insert(EarlyAdopter entity)
        {
            return this.earlyAdopterRepository.Insert(entity);
        }

        public void Update(EarlyAdopter entity)
        {
            this.earlyAdopterRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this.earlyAdopterRepository.Delete(id);
        }

        #region NotImplementedMembers


        #endregion

    }
}
