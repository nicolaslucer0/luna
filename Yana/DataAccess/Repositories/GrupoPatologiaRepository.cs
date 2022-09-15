using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories
{
    public class GrupoPatologiaRepository : IGrupoPatologiaRepository<GrupoPatologia>
    {
        public GrupoPatologia Get(int id)
        {
            using (var context = new LunaContext())
            {
                GrupoPatologia grupoPatologia = (from ctx in context.GrupoPatologia
                                      where !ctx.BajaLogica
                                      && ctx.IdGrupoPatologia == id
                                      select ctx).FirstOrDefault();

                return grupoPatologia;
            }
        }

        public List<GrupoPatologia> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<GrupoPatologia> grupoPatologia = (from ctx in context.GrupoPatologia
                                                       where !ctx.BajaLogica
                                                       select ctx).ToList();

                return grupoPatologia;
            }
        }
    }
}
