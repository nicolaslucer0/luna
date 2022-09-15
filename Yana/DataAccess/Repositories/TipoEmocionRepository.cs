using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;

namespace Yana.DataAccess.Repositories
{
    public class TipoEmocionRepository : ITipoEmocionRepository<TipoEmocion>
    {
        public TipoEmocion Get(int id)
        {
            using (var context = new LunaContext())
            {
                TipoEmocion tipoEmocion = (from ctx in context.TipoEmocion
                                           where !ctx.BajaLogica
                                                 && ctx.IdTipoEmocion == id
                                           select ctx).FirstOrDefault();

                return tipoEmocion;
            }
        }

        public List<TipoEmocion> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<TipoEmocion> tipoEmociones = (from ctx in context.TipoEmocion
                                                   where !ctx.BajaLogica
                                                   select ctx).ToList();

                return tipoEmociones;
            }
        }
    }
}
