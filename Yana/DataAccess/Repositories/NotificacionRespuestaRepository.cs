using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Helpers;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories
{
    public class NotificacionRespuestaRepository : INotificacionRespuestaRepository<NotificacionRespuesta>
    {
        public void Delete(int id)
        {
            using (var context = new YanaContext())
            {
                NotificacionRespuesta notificacion = context.NotificacionRespuesta.FirstOrDefault(a => a.IdNotificacionRespuesta == id);
                if(notificacion !=null)
                {
                    notificacion.BajaLogica = true;
                    notificacion.FechaModificacion = DateTime.Now;
                    notificacion.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public NotificacionRespuesta Get(int id)
        {
            using (var context = new YanaContext())
            {
                NotificacionRespuesta notificacion = (from ctx in context.NotificacionRespuesta
                                                      where !ctx.BajaLogica
                                                      && ctx.IdNotificacion == id
                                                      select ctx).FirstOrDefault();
                return notificacion;
            }
        }

        public List<NotificacionRespuesta> GetAll()
        {
            using (var context = new YanaContext())
            {
                List<NotificacionRespuesta> notificacion = (from ctx in context.NotificacionRespuesta
                                                            where !ctx.BajaLogica
                                                            select ctx).ToList();
                return notificacion;
            }
        }

        public int Insert(NotificacionRespuesta entity)
        {
            using (var context = new YanaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.NotificacionRespuesta.Add(entity);
                context.SaveChanges();

                return entity.IdNotificacionRespuesta;
            }
        }

        public void Update(NotificacionRespuesta entity)
        {
            using (var context = new YanaContext())
            {
                NotificacionRespuesta notificacion = (from ctx in context.NotificacionRespuesta
                                                      where !ctx.BajaLogica
                                                        && ctx.IdNotificacion == entity.IdNotificacion
                                                      select ctx).FirstOrDefault();
                
                if (notificacion != null)
                {
                    notificacion.Respuesta = entity.Respuesta;

                    notificacion.FechaModificacion = DateTime.Now;
                    notificacion.IdUsuarioModificacion = UserCache.IdUsuario;
                }

                context.SaveChanges();
            }
        }
    }
}
