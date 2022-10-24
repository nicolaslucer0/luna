using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories
{
    public class PatologiaGrupoPatologiaRepository : IPatologiaGrupoPatologiaRepository<PatologiaGrupoPatologia>
    {
        public PatologiaGrupoPatologia Get(int id)
        {
            using (var context = new LunaContext())
            {
                PatologiaGrupoPatologia patologiaGrupoPatologia = (from ctx in context.PatologiaGrupoPatologia
                                                                   where !ctx.BajaLogica
                                                                   && ctx.IdPatologiaGrupoPatologia == id
                                                                   select ctx).FirstOrDefault();
                return patologiaGrupoPatologia;
            }
        }

        public List<PatologiaGrupoPatologia> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<PatologiaGrupoPatologia> patologiaGrupoPatologia = (from ctx in context.PatologiaGrupoPatologia
                                                                         where !ctx.BajaLogica
                                                                         select ctx).ToList();

                return patologiaGrupoPatologia;
            }
        }
    }
}
