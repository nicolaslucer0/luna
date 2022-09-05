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
    public class GrupoPatologiaService : IGrupoPatologiaService
    {
        private readonly GrupoPatologiaRepository grupoPatologiaRepository;

        public GrupoPatologiaService()
        {
            this.grupoPatologiaRepository = new GrupoPatologiaRepository();
        }

        public List<GrupoPatologia> GetAll()
        {
            return this.grupoPatologiaRepository.GetAll();
        }

        public GrupoPatologia GetById(int id)
        {
            return this.grupoPatologiaRepository.Get(id);
        }


        #region NotImplementedMembers


        #endregion

    }
}
