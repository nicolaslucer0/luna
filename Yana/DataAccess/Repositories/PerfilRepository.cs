using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories
{
    public class PerfilRepository : IPerfilRepository<Perfil>
    {        
        public Perfil Get(int id)
        {
            using (var context = new YanaContext())
            {
                Perfil perfil = (from ctx in context.Perfil
                                       where !ctx.BajaLogica
                                       && ctx.IdPerfil == id
                                       select ctx).FirstOrDefault();
                return perfil;
            }
        }

        public List<Perfil> GetAll()
        {
            using (var context = new YanaContext())
            {
                List<Perfil> perfiles = (from ctx in context.Perfil
                                         where !ctx.BajaLogica
                                         select ctx).ToList();

                return perfiles;
            }
        }

        #region NotImplementedMembers

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public int Insert(Perfil entity)
        {
            throw new NotImplementedException();
        }

        public void Update(Perfil entity)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
