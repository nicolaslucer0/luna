using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;
using Microsoft.EntityFrameworkCore;

namespace Yana.DataAccess.Repositories
{
    public class RegistroDiarioRepository : IRegistroDiarioRepository<RegistroDiario>
    {
        public void Delete(int id)
        {
            using (var context = new LunaContext())
            {
                RegistroDiario registroDiario = context.RegistroDiario.FirstOrDefault(a => a.IdRegistroDiario == id);
                
                if(registroDiario != null)
                {
                    registroDiario.BajaLogica = true;
                    registroDiario.IdUsuarioModificacion = UserCache.IdUsuario;
                    registroDiario.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }

        public RegistroDiario Get(int id)
        {
            using (var context = new LunaContext())
            {
                RegistroDiario registroDiario = (from ctx in context.RegistroDiario
                                                 .Include(x => x.IdTipoEmocionNavigation)
                                                 .Include(x => x.IdTipoEmocionResultadoNavigation)
                                                 .Include(y =>y.RegistroDiarioRespuesta)
                                                 where !ctx.BajaLogica
                                                 && ctx.IdRegistroDiario == id
                                                 select ctx).FirstOrDefault();
                return registroDiario;
            }
        }

        public List<RegistroDiario> GetAllById(int id)
        {
            using (var context = new LunaContext())
            {
                List<RegistroDiario> registroDiario = (from ctx in context.RegistroDiario
                                                       .Include(x => x.IdTipoEmocionNavigation)
                                                       .Include(x => x.IdTipoEmocionResultadoNavigation)
                                                       .Include(y => y.RegistroDiarioRespuesta)
                                                       where !ctx.BajaLogica
                                                       && ctx.IdPaciente == id
                                                       select ctx).ToList();
                return registroDiario;
            }
        }

        public List<RegistroDiario> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<RegistroDiario> registroDiario = (from ctx in context.RegistroDiario
                                                       .Include(x => x.IdTipoEmocionNavigation)
                                                       .Include(x => x.IdTipoEmocionResultadoNavigation)
                                                       .Include(y => y.RegistroDiarioRespuesta)
                                                       where !ctx.BajaLogica
                                                       select ctx).ToList();
                return registroDiario;
            }
        }

        public int Insert(RegistroDiario entity)
        {
            using (var context = new LunaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                entity.IdPaciente = UserCache.IdUsuario;

                context.RegistroDiario.Add(entity);
                context.SaveChanges();

                return entity.IdRegistroDiario;
            }
        }

        public void Update(RegistroDiario entity)
        {
            using (var context = new LunaContext())
            {
                RegistroDiario registroDiario = (from ctx in context.RegistroDiario
                                                 where !ctx.BajaLogica
                                                 && ctx.IdRegistroDiario == entity.IdRegistroDiario
                                                 select ctx).FirstOrDefault();
                if(registroDiario != null)
                {
                    registroDiario.IdTipoEmocionResultado = entity.IdTipoEmocionResultado;
                    registroDiario.GradoCreenciaPensamientoAutomatico = entity.GradoCreenciaPensamientoAutomatico;
                    registroDiario.GradoCreenciaRespuestaRacional = entity.GradoCreenciaRespuestaRacional;
                    registroDiario.GradoCreenciaResultado = entity.GradoCreenciaResultado;
                    registroDiario.IdTipoEmocion = entity.IdTipoEmocion;
                    registroDiario.IntensidadEmocion = entity.IntensidadEmocion;
                    registroDiario.MotivoSituacion = entity.MotivoSituacion;
                    registroDiario.PensamientoAutomatico = entity.PensamientoAutomatico;
                    registroDiario.RegistroDiarioRespuesta = entity.RegistroDiarioRespuesta;
                    registroDiario.RespuestaRacional = entity.RespuestaRacional;
                    registroDiario.Situacion = entity.Situacion;
                    registroDiario.Seen = entity.Seen;
                    registroDiario.FechaModificacion = DateTime.Now;
                    registroDiario.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public List<RegistroDiario> GetAllWithFk()
        {
            using (var context = new LunaContext())
            {
                List<RegistroDiario> registrosDiarios = context.RegistroDiario
                                                            .Include(x => x.IdTipoEmocionNavigation)
                                                            .Include(x => x.IdPacienteNavigation)
                                                                .ThenInclude(x => x.ProfesionalPacienteIdPacienteNavigation)
                                                      .Where(x => !x.BajaLogica)
                                                      .ToList();

                return registrosDiarios;
            }
        }

        public int GetTotalRegistrosDiarios()
        {
            using (var context = new LunaContext())
            {
                int cantidadRegistrosDiarios = (from ctx in context.RegistroDiario
                                                where !ctx.BajaLogica
                                                select ctx).Count();

                return cantidadRegistrosDiarios;
            }
        }
    }
}
