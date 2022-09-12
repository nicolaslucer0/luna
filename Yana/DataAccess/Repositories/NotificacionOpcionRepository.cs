using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;

namespace Yana.DataAccess.Repositories
{
    public class NotificacionOpcionRepository : INotificacionOpcionRepository<NotificacionOpcion>
    {
        public void Delete(int id)
        {
            using (var context = new LunaContext())
            {
                NotificacionOpcion notificacion = context.NotificacionOpcion.FirstOrDefault(a => a.IdNotificacionOpcion == id);
                
                if(notificacion!=null)
                {
                    notificacion.BajaLogica = true;
                    notificacion.FechaModificacion = DateTime.Now;
                    notificacion.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public NotificacionOpcion Get(int id)
        {
            using (var context = new LunaContext())
            {
                NotificacionOpcion notificacion = (from ctx in context.NotificacionOpcion
                                                   where !ctx.BajaLogica
                                                   && ctx.IdNotificacionOpcion == id
                                                   select ctx).FirstOrDefault();

                return notificacion;
            }
        }

        public List<NotificacionOpcion> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<NotificacionOpcion> notificacion = (from ctx in context.NotificacionOpcion
                                                         where !ctx.BajaLogica
                                                         select ctx).ToList();

                return notificacion;
            }
        }

        public int Insert(NotificacionOpcion entity)
        {
            using (var context = new LunaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.NotificacionOpcion.Add(entity);
                context.SaveChanges();

                return entity.IdNotificacionOpcion;
            }
        }

        public void Update(NotificacionOpcion entity)
        {
            using (var context = new LunaContext())
            {
                NotificacionOpcion notificacion = (from ctx in context.NotificacionOpcion
                                                   where !ctx.BajaLogica
                                                   && ctx.IdNotificacionOpcion == entity.IdNotificacionOpcion
                                                   select ctx).FirstOrDefault();
                if(notificacion != null)
                {
                    notificacion.Descripcion = entity.Descripcion;

                    notificacion.FechaModificacion = DateTime.Now;
                    notificacion.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public List<NotificacionOpcion> GetByIdNotificacion(int idNotificacion)
        {
            using (var context = new LunaContext())
            {
                List<NotificacionOpcion> notificacionOpciones = (from ctx in context.NotificacionOpcion
                                                         where !ctx.BajaLogica
                                                            && ctx.IdNotificacion == idNotificacion
                                                         select ctx).ToList();

                return notificacionOpciones;
            }
        }
    }
}
