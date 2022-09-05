using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;

namespace Yana.DataAccess.Repositories
{
    public class PatologiaRepository : IPatologiaRepository<Patologia>
    {
        public Patologia Get(int id)
        {
            using (var context = new YanaContext())
            {
                Patologia patologia = (from ctx in context.Patologia
                                       where !ctx.BajaLogica
                                       && ctx.IdPatologia == id
                                       select ctx).FirstOrDefault();
                return patologia;
            }
        }

        public List<Patologia> GetAll()
        {
            using (var context = new YanaContext())
            {
                List<Patologia> patologia = (from ctx in context.Patologia
                                             where !ctx.BajaLogica
                                             select ctx).ToList();

                return patologia;
            }
        }

        public int Insert(Patologia entity)
        {
            using (var context = new YanaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.Patologia.Add(entity);

                context.SaveChanges();

                return entity.IdPatologia;
            }
        }

        public void Update(Patologia entity)
        {
            using (var context = new YanaContext())
            {
                Patologia patologia = (from ctx in context.Patologia
                                             where !ctx.BajaLogica
                                             && ctx.IdPatologia == entity.IdPatologia
                                             select ctx).FirstOrDefault();
                if (patologia != null)
                {
                    patologia.Nombre = entity.Nombre;
                    patologia.Descripcion = entity.Descripcion;

                    patologia.IdUsuarioModificacion = UserCache.IdUsuario;
                    patologia.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }

        public void Delete(int id)
        {
            using (var context = new YanaContext())
            {
                Patologia patologia = context.Patologia.FirstOrDefault(a => a.IdPatologia == id);

                if (patologia != null)
                {
                    patologia.BajaLogica = true;
                    patologia.FechaModificacion = DateTime.Now;
                    patologia.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public List<Patologia> GetByIdPaciente(int idPaciente)
        {
            using (var context = new YanaContext())
            {
                List<Patologia> patologias = context.PacientePatologia
                                                    .Include(x => x.IdPatologiaNavigation)
                                                .Where(x => !x.BajaLogica && (int)x.IdPaciente == idPaciente)
                                                .Select(x => x.IdPatologiaNavigation)
                                                .ToList();

                return patologias;
            }
        }
    }
}
