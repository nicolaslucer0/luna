using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;
using Yana.Enums;

namespace Yana.DataAccess.Repositories
{
    public class NotificacionRepository : INotificacionRepository<Notificacion>
    {
        public void Delete(int id)
        {
            using (var context = new LunaContext())
            {
                Notificacion notificacion = context.Notificacion.FirstOrDefault(a => a.IdNotificacion == id);
                
                if(notificacion!=null)
                {
                    notificacion.BajaLogica = true;
                    notificacion.FechaModificacion = DateTime.Now;
                    notificacion.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public Notificacion Get(int id)
        {
            using (var context = new LunaContext())
            {
                Notificacion notificacion = (from ctx in context.Notificacion
                                             where !ctx.BajaLogica
                                             && ctx.IdNotificacion == id
                                             select ctx).FirstOrDefault();

                return notificacion;
            }
        }

        public List<Notificacion> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<Notificacion> notificacion = (from ctx in context.Notificacion
                                                   where !ctx.BajaLogica
                                                   select ctx).ToList();

                return notificacion;
            }
        }

        public int Insert(Notificacion entity)
        {
            using (var context = new LunaContext())
            {
                entity.IdEstadoNotificacion = 1;
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.Notificacion.Add(entity);
                context.SaveChanges();

                return entity.IdNotificacion;
            }
        }

        public void Update(Notificacion entity)
        {
            using (var context = new LunaContext())
            {
                Notificacion notificacion = (from ctx in context.Notificacion
                                             where !ctx.BajaLogica
                                             && ctx.IdNotificacion == entity.IdNotificacion
                                             select ctx).FirstOrDefault();
                if(notificacion !=null)
                {
                    notificacion.Mensaje = entity.Mensaje;
                    notificacion.FechaHora = entity.FechaHora;

                    notificacion.IdUsuarioModificacion = UserCache.IdUsuario;
                    notificacion.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }

        public IEnumerable<Notificacion> GetAllByProfesionalAndPaciente(int idProfesional, int idPaciente)
        {
            using (var context = new LunaContext())
            {
                List<Notificacion> notificaciones = (from ctx in context.Notificacion
                                                        .Include(n => n.IdEstadoNotificacionNavigation)
                                                        .Include(n => n.IdPacienteNavigation)
                                                        .Include(n => n.IdProfesionalNavigation)
                                                        .Include(n => n.IdGrupoNotificacionNavigation)
                                                        .Include(n => n.NotificacionRespuesta)
                                                   where !ctx.BajaLogica
                                                          && ctx.IdProfesional == idProfesional
                                                          && ctx.IdPaciente == idPaciente
                                                   select ctx).ToList();

                foreach(Notificacion notificacion in notificaciones)
                {
                    notificacion.NotificacionRespuesta = (from ctx in context.NotificacionRespuesta
                                                                .Include(x => x.IdNotificacionOpcionNavigation)
                                                          where !ctx.BajaLogica
                                                            && ctx.IdNotificacion == notificacion.IdNotificacion
                                                          select ctx).ToList();
                }

                return notificaciones;
            }
        }

        public List<Notificacion> GetAllByIdGrupo(int idGrupo)
        {
            using (var context = new LunaContext())
            {
                List<Notificacion> notificacion = (from ctx in context.Notificacion
                    where !ctx.BajaLogica
                          && ctx.IdGrupoNotificacion == idGrupo
                    select ctx).ToList();

                return notificacion;
            }
        }

        public List<Notificacion> GetByPacienteYEstados(int idPaciente, List<EnumEstadoNotificacion> estadosNotificaciones)
        {
            using (var context = new LunaContext())
            {
                List<int> estadosNotificacion = estadosNotificaciones.Select(x => Convert.ToInt32(x)).ToList();

                List<Notificacion> notificacion = (from ctx in context.Notificacion
                                                        .Include(n => n.NotificacionOpcion)
                                                        .Include(n => n.IdEstadoNotificacionNavigation)
                                                   where !ctx.BajaLogica
                                                          && estadosNotificacion.Contains((int)ctx.IdEstadoNotificacion)
                                                          && ctx.IdPaciente == idPaciente
                                                   select ctx).ToList();

                return notificacion;
            }
        }

        public IEnumerable<Notificacion> GetAllByProfesional(int idProfesional)
        {
            using (var context = new LunaContext())
            {
                List<Notificacion> notificacion = (from ctx in context.Notificacion
                        .Include(n => n.IdEstadoNotificacionNavigation)
                        .Include(n => n.IdPacienteNavigation)
                        .Include(n => n.IdProfesionalNavigation)
                        .Include(n => n.IdGrupoNotificacionNavigation)
                    where !ctx.BajaLogica
                          && ctx.IdProfesional == idProfesional
                    select ctx).ToList();

                return notificacion;
            }
        }

        public Notificacion GetWithFK(int idNotificacion)
        {
            using (var context = new LunaContext())
            {
                Notificacion notificacion = (from ctx in context.Notificacion
                                                 .Include(n => n.NotificacionOpcion)
                                                 .Include(n => n.NotificacionRespuesta)
                                             where !ctx.BajaLogica
                                                     && ctx.IdNotificacion == idNotificacion
                                             select ctx).FirstOrDefault();

                if (notificacion != null)
                    notificacion.NotificacionOpcion = notificacion.NotificacionOpcion.Where(x => !x.BajaLogica).ToList();

                return notificacion;
            }
        }

        public void UpdateStatus(int idNotificacion, EnumEstadoNotificacion estadoNotificacion)
        {
            using (var context = new LunaContext())
            {
                Notificacion notificacion = (from ctx in context.Notificacion
                                             where !ctx.BajaLogica
                                                    && ctx.IdNotificacion == idNotificacion
                                             select ctx).FirstOrDefault();

                if (notificacion != null)
                {
                    notificacion.IdEstadoNotificacion = Convert.ToInt32(estadoNotificacion);

                    notificacion.IdUsuarioModificacion = UserCache.IdUsuario;
                    notificacion.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }

        public List<Notificacion> GetByEstados(List<EnumEstadoNotificacion> estadosNotificaciones)
        {
            using (var context = new LunaContext())
            {
                List<int> estadosNotificacion = estadosNotificaciones.Select(x => Convert.ToInt32(x)).ToList();

                List<Notificacion> notificacion = (from ctx in context.Notificacion
                                                        .Include(n => n.IdPacienteNavigation)
                                                   where !ctx.BajaLogica
                                                            && estadosNotificacion.Contains((int)ctx.IdEstadoNotificacion)
                                                   select ctx).ToList();

                return notificacion;
            }
        }

        public int GetTotalNotificaciones()
        {
            using (var context = new LunaContext())
            {
                int cantidadNotificaciones = (from ctx in context.Notificacion
                                              where !ctx.BajaLogica
                                              select ctx).Count();

                return cantidadNotificaciones;
            }
        }

        public int CountNotificationsByProfesionalAndStatus(int idProfesional, int estado)
        {
            using (var context = new LunaContext())
            {
                return (from ctx in context.Notificacion
                        where !ctx.BajaLogica
                            && ctx.IdProfesional == idProfesional
                            && ctx.IdEstadoNotificacion == estado
                        select ctx).Count();

                
            }
        }
    }
}
