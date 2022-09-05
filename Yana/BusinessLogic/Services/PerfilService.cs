using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.DataAccess.Repositories;
using Yana.Models.DomainEntities;

namespace Yana.BusinessLogic.Services
{
    public class PerfilService : IGetterService<Perfil>
    {
        #region Constructor

        private PerfilRepository PerfilRepository { get; set; }

        public PerfilService()
        {
            this.PerfilRepository = new PerfilRepository();
        }

        #endregion

        public List<Perfil> GetAll()
        {
            return this.PerfilRepository.GetAll();
        }

        public Perfil GetById(int id)
        {
            throw new NotImplementedException();
        }
    }
}
