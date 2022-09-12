using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;

namespace Yana.DataAccess.Repositories
{
    public class ProfesionalPacienteRepository : IProfesionalPacienteRepository<ProfesionalPaciente>
    {
        public void Delete(int id)
        {
            using (var context = new LunaContext())
            {
                ProfesionalPaciente profesionalPaciente = context.ProfesionalPaciente.FirstOrDefault(a => a.IdProfesionalPaciente == id);
                
                if (profesionalPaciente !=null)
                {
                    profesionalPaciente.BajaLogica = true;
                    profesionalPaciente.IdUsuarioModificacion = UserCache.IdUsuario;
                    profesionalPaciente.FechaModificacion = DateTime.Now;
                }

                context.SaveChanges();
            }
        }

        public ProfesionalPaciente Get(int id)
        {
            using (var context = new LunaContext())
            {
                ProfesionalPaciente profesionalPaciente = (from ctx in context.ProfesionalPaciente
                                                           where !ctx.BajaLogica
                                                           && ctx.IdProfesionalPaciente == id
                                                           select ctx).FirstOrDefault();
                return profesionalPaciente;
            }
        }

        public List<ProfesionalPaciente> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<ProfesionalPaciente> profesionalPaciente = (from ctx in context.ProfesionalPaciente
                                                                 where !ctx.BajaLogica
                                                                 select ctx).ToList();
                return profesionalPaciente;
            }
        }

        public int Insert(ProfesionalPaciente entity)
        {
            using (var context = new LunaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                entity.IdEstadoProfesionalPaciente = 1;

                context.ProfesionalPaciente.Add(entity);
                context.SaveChanges();

                return entity.IdProfesionalPaciente;
            }
        }

        public void Update(ProfesionalPaciente entity)
        {
            using (var context = new LunaContext())
            {
                ProfesionalPaciente profesionalPaciente = (from ctx in context.ProfesionalPaciente
                                                           where !ctx.BajaLogica
                                                           && ctx.IdProfesionalPaciente == entity.IdProfesionalPaciente
                                                           select ctx).FirstOrDefault();
                if (profesionalPaciente != null)
                {
                    profesionalPaciente.IdPaciente = entity.IdPaciente;
                    profesionalPaciente.IdProfesional = entity.IdProfesional;
                    profesionalPaciente.IdEstadoProfesionalPaciente = entity.IdEstadoProfesionalPaciente;

                    profesionalPaciente.FechaModificacion = DateTime.Now;
                    profesionalPaciente.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public List<ProfesionalPaciente> GetPacientesByProfesional(int idProfesional)
        {
            using (var context = new LunaContext())
            {
                List<ProfesionalPaciente> profesionalPaciente = (from ctx in context.ProfesionalPaciente
                                                                 where !ctx.BajaLogica
                                                                        && ctx.IdProfesional == idProfesional
                                                                 select ctx).ToList();
                return profesionalPaciente;
            }
        }

        public List<ProfesionalPaciente> GetPacientesByIdsProfesionales(List<int> idsProfesionales)
        {
            using (var context = new LunaContext())
            {
                List<ProfesionalPaciente> profesionalPaciente = (from ctx in context.ProfesionalPaciente
                                                                 where !ctx.BajaLogica
                                                                        && ctx.IdProfesional != null
                                                                        && idsProfesionales.Contains(Convert.ToInt32(ctx.IdProfesional))
                                                                 select ctx).ToList();
                return profesionalPaciente;
            }
        }
    }
}
