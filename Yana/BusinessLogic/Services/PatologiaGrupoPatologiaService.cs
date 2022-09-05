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
    public class PatologiaGrupoPatologiaService : IPatologiaGrupoPatologiaService
    {
        private readonly PatologiaGrupoPatologiaRepository patologiaGrupoPatologiaRepository;

        public PatologiaGrupoPatologiaService()
        {
            this.patologiaGrupoPatologiaRepository = new PatologiaGrupoPatologiaRepository();
        }

        public List<PatologiaGrupoPatologia> GetAll()
        {
            return this.patologiaGrupoPatologiaRepository.GetAll();
        }

        public PatologiaGrupoPatologia GetById(int id)
        {
            return this.patologiaGrupoPatologiaRepository.Get(id);
        }


        #region NotImplementedMembers


        #endregion

    }
}
