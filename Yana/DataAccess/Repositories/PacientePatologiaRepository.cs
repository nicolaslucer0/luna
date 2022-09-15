using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;
using Microsoft.EntityFrameworkCore;

namespace Yana.DataAccess.Repositories
{
    public class PacientePatologiaRepository : IPacientePatologiaRepository<PacientePatologia>
    {
        public void Delete(int id)
        {
            using (var context = new LunaContext())
            {
                PacientePatologia pacientePatologia = context.PacientePatologia.FirstOrDefault(a => a.IdPacientePatologia == id);
                
                if(pacientePatologia != null)
                {
                    pacientePatologia.BajaLogica = true;
                    pacientePatologia.IdUsuarioModificacion = UserCache.IdUsuario;
                    pacientePatologia.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }

        public PacientePatologia Get(int id)
        {
            using (var context = new LunaContext())
            {
                PacientePatologia pacientePatologia = (from ctx in context.PacientePatologia
                                                       where !ctx.BajaLogica
                                                       && ctx.IdPacientePatologia == id
                                                       select ctx).FirstOrDefault();
                return pacientePatologia;
            }
        }

        public List<PacientePatologia> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<PacientePatologia> pacientePatologia = (from ctx in context.PacientePatologia
                                                             where !ctx.BajaLogica
                                                             select ctx).ToList();
                return pacientePatologia;
            }
        }

        public int Insert(PacientePatologia entity)
        {
            using (var context = new LunaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.PacientePatologia.Add(entity);
                context.SaveChanges();

                return entity.IdPacientePatologia;
            }
        }

        public void Update(PacientePatologia entity)
        {
            using (var context = new LunaContext())
            {
                PacientePatologia pacientePatologia = (from ctx in context.PacientePatologia
                                                       where !ctx.BajaLogica
                                                       && ctx.IdPacientePatologia == entity.IdPacientePatologia
                                                       select ctx).FirstOrDefault();
                if(pacientePatologia!=null)
                {
                    pacientePatologia.IdPatologia = entity.IdPatologia;

                    pacientePatologia.IdUsuarioModificacion = UserCache.IdUsuario;
                    pacientePatologia.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }


        public List<PacientePatologia> GetAllWithFk()
        {
            using (var context = new LunaContext())
            {
                List<PacientePatologia> pacientesPatologias = context.PacientePatologia
                                                                    .Include(x => x.IdPacienteNavigation)
                                                                    .Include(y => y.IdPatologiaNavigation)
                                                              .Where(x => !x.BajaLogica)
                                                              .ToList();

                return pacientesPatologias;
            }
        }

        public List<PacientePatologia> GetByIdPaciente(int idPaciente)
        {
            using (var context = new LunaContext())
            {
                List<PacientePatologia> pacientesPatologias = context.PacientePatologia
                                                      .Include(x => x.IdPacienteNavigation)
                                                      .Include(y => y.IdPatologiaNavigation)
                                                      .Where(x => !x.BajaLogica && x.IdPaciente == idPaciente)
                                                      .ToList();

                return pacientesPatologias;
            }
        }

        public void DeleteByPatologiaYPaciente(int idPatologia, int idPaciente)
        {
            using (var context = new LunaContext())
            {
                PacientePatologia pacientePatologia = context.PacientePatologia.FirstOrDefault(a => !a.BajaLogica && a.IdPatologia == idPatologia && a.IdPaciente == idPaciente);
                
                if (pacientePatologia != null)
                {
                    pacientePatologia.BajaLogica = true;
                    pacientePatologia.IdUsuarioModificacion = UserCache.IdUsuario;
                    pacientePatologia.FechaModificacion = DateTime.Now;
                }

                context.SaveChanges();
            }
        }

        public void DeleteByIdPaciente(int idPaciente)
        {
            using (var context = new LunaContext())
            {
                List<PacientePatologia> pacientePatologias = context.PacientePatologia.Where(a => a.IdPaciente == idPaciente).ToList();
                
                if (pacientePatologias != null && pacientePatologias.Any())
                {
                    foreach(PacientePatologia pacientePatologia in pacientePatologias)
                    {
                        pacientePatologia.BajaLogica = true;
                        pacientePatologia.IdUsuarioModificacion = UserCache.IdUsuario;
                        pacientePatologia.FechaModificacion = DateTime.Now;
                    }
                }

                context.SaveChanges();
            }
        }
    }
}
