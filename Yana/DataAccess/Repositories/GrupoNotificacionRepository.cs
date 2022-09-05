using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;

namespace Yana.DataAccess.Repositories
{
    public class GrupoNotificacionRepository : IGrupoNotificacionRepository<GrupoNotificacion>
    {
        public void Delete(int id)
        {
            using (var context = new YanaContext())
            {
                GrupoNotificacion grupoNotificacion = context.GrupoNotificacion.FirstOrDefault(a => a.IdGrupoNotificacion == id);
                
                if(grupoNotificacion !=null)
                {
                    grupoNotificacion.BajaLogica = true;
                    grupoNotificacion.FechaModificacion = DateTime.Now;
                    grupoNotificacion.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public GrupoNotificacion Get(int id)
        {
            using (var context = new YanaContext())
            {
                GrupoNotificacion grupoNotificacion = (from ctx in context.GrupoNotificacion
                                                       where !ctx.BajaLogica
                                                       && ctx.IdGrupoNotificacion == id
                                                       select ctx).FirstOrDefault();

                return grupoNotificacion;
            }
        }

        public List<GrupoNotificacion> GetAll()
        {
            using (var context = new YanaContext())
            {
                List<GrupoNotificacion> grupoNotificacion = (from ctx in context.GrupoNotificacion
                                                             where !ctx.BajaLogica
                                                             select ctx).ToList();

                return grupoNotificacion;
            }
        }

        public int Insert(GrupoNotificacion entity)
        {
            using (var context = new YanaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.GrupoNotificacion.Add(entity);
                context.SaveChanges();

                return entity.IdGrupoNotificacion;
            }
        }

        public void Update(GrupoNotificacion entity)
        {
            using (var context = new YanaContext())
            {
                GrupoNotificacion grupoNotificacion = (from ctx in context.GrupoNotificacion
                                                       where !ctx.BajaLogica
                                                       && ctx.IdGrupoNotificacion == entity.IdGrupoNotificacion
                                                       select ctx).FirstOrDefault();
                if(grupoNotificacion != null)
                {
                    grupoNotificacion.Notificacion = entity.Notificacion;
                    grupoNotificacion.Descripcion = entity.Descripcion;

                    grupoNotificacion.IdUsuarioModificacion = UserCache.IdUsuario;
                    grupoNotificacion.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }
    }
}
