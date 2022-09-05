using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;

namespace Yana.DataAccess.Repositories
{
    public class RegistroDiarioRespuestaRepository : IRegistroDiarioRespuestaRepository<RegistroDiarioRespuesta>
    {
        public void Delete(int id)
        {
            using (var context = new YanaContext())
            {
                RegistroDiarioRespuesta registroDiarioRespuesta = context.RegistroDiarioRespuesta.FirstOrDefault(a => a.IdRegistroDiarioRespuesta == id);
                
                if(registroDiarioRespuesta != null)
                {
                    registroDiarioRespuesta.BajaLogica = true;
                    registroDiarioRespuesta.FechaModificacion = DateTime.Now;
                    registroDiarioRespuesta.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public RegistroDiarioRespuesta Get(int id)
        {
            using (var context = new YanaContext())
            {
                RegistroDiarioRespuesta registroDiarioRespuesta = (from ctx in context.RegistroDiarioRespuesta
                                                                   where !ctx.BajaLogica
                                                                   && ctx.IdRegistroDiarioRespuesta == id
                                                                   select ctx).FirstOrDefault();
                return registroDiarioRespuesta;
            }
        }

        public List<RegistroDiarioRespuesta> GetAll()
        {
            using (var context = new YanaContext())
            {
                List<RegistroDiarioRespuesta> registroDiario = (from ctx in context.RegistroDiarioRespuesta
                                                                where !ctx.BajaLogica
                                                                select ctx).ToList();
                return registroDiario;
            }
        }

        public int Insert(RegistroDiarioRespuesta entity)
        {
            using (var context = new YanaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                entity.IdProfesional = UserCache.IdUsuario;

                context.RegistroDiarioRespuesta.Add(entity);
                context.SaveChanges();

                return entity.IdRegistroDiarioRespuesta;
            }
        }

        public void Update(RegistroDiarioRespuesta entity)
        {
            using (var context = new YanaContext())
            {
                RegistroDiarioRespuesta registroDiarioRespuesta = (from ctx in context.RegistroDiarioRespuesta
                                                                   where !ctx.BajaLogica
                                                                   && ctx.IdRegistroDiarioRespuesta == entity.IdRegistroDiarioRespuesta
                                                                   select ctx).FirstOrDefault();
                if(registroDiarioRespuesta != null)
                {
                    registroDiarioRespuesta.Nota = entity.Nota;

                    registroDiarioRespuesta.IdUsuarioModificacion = UserCache.IdUsuario;
                    registroDiarioRespuesta.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }
    }
}
