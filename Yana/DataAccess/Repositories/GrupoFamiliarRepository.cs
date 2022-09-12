using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;

namespace Yana.DataAccess.Repositories
{
    public class GrupoFamiliarRepository : IGrupoFamiliarRepository<GrupoFamiliar>
    {
        public void Delete(int id)
        {
            using (var context = new LunaContext())
            {
                GrupoFamiliar grupoFamiliar = context.GrupoFamiliar.FirstOrDefault(a=> a.IdGrupoFamiliar ==id);
                if(grupoFamiliar != null)
                {
                    grupoFamiliar.BajaLogica = true;
                    grupoFamiliar.IdUsuarioModificacion= UserCache.IdUsuario;
                    grupoFamiliar.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }

        public GrupoFamiliar Get(int id)
        {
            using (var context = new LunaContext())
            {
                GrupoFamiliar grupoFamiliar = (from ctx in context.GrupoFamiliar
                                               where !ctx.BajaLogica
                                               && ctx.IdGrupoFamiliar == id
                                               select ctx).FirstOrDefault();

                return grupoFamiliar;
            }
        }

        public List<GrupoFamiliar> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<GrupoFamiliar> grupoFamiliar = (from ctx in context.GrupoFamiliar
                                                     where !ctx.BajaLogica
                                                     select ctx).ToList();

                return grupoFamiliar;
            }
        }

        public int Insert(GrupoFamiliar entity)
        {
            using (var context = new LunaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.GrupoFamiliar.Add(entity);
                context.SaveChanges();

                return entity.IdGrupoFamiliar;
            }
        }

        public void Update(GrupoFamiliar entity)
        {
            using (var context = new LunaContext())
            {
                GrupoFamiliar grupoFamiliar = (from ctx in context.GrupoFamiliar
                                               where !ctx.BajaLogica
                                               && ctx.IdGrupoFamiliar == entity.IdGrupoFamiliar
                                               select ctx).FirstOrDefault();
                if(grupoFamiliar !=null)
                {
                    grupoFamiliar.Nombre = entity.Nombre;
                    grupoFamiliar.Observaciones = entity.Observaciones;
                    grupoFamiliar.IdParentesco = entity.IdParentesco;

                    grupoFamiliar.IdUsuarioModificacion = UserCache.IdUsuario;
                    grupoFamiliar.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }
    }
}
