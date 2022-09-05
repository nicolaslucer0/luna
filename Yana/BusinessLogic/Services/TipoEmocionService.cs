using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.DataAccess.Repositories;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;

namespace Yana.BusinessLogic.Services
{
    public class TipoEmocionService : ITipoEmocionService
    {
        private readonly TipoEmocionRepository TipoEmocionRepository;

        public TipoEmocionService()
        {
            this.TipoEmocionRepository = new TipoEmocionRepository();
        }

        public List<TipoEmocion> GetAll()
        {
            return this.TipoEmocionRepository.GetAll();
        }

        public TipoEmocion GetById(int id)
        {
            return this.TipoEmocionRepository.Get(id);
        }
    }
}
