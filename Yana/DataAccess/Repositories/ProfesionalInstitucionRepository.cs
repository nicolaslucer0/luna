using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;

namespace Yana.DataAccess.Repositories
{
    public class ProfesionalInstitucionRepository : IProfesionalInstitucionRepository<ProfesionalInstitucion>
    {
        public void Delete(int id)
        {
            using (var context = new YanaContext())
            {
                ProfesionalInstitucion profesionalInstitucion = context.ProfesionalInstitucion.FirstOrDefault(a => a.IdProfesionalInstitucion == id);
                
                if(profesionalInstitucion !=null)
                {
                    profesionalInstitucion.BajaLogica = true;
                    profesionalInstitucion.IdUsuarioModificacion = UserCache.IdUsuario;
                    profesionalInstitucion.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }

        public ProfesionalInstitucion Get(int id)
        {
            using (var context = new YanaContext())
            {
                ProfesionalInstitucion profesionalInstitucion = (from ctx in context.ProfesionalInstitucion
                                                                 where !ctx.BajaLogica
                                                                 && ctx.IdProfesionalInstitucion == id
                                                                 select ctx).FirstOrDefault();
                return profesionalInstitucion;
            }
        }

        public List<ProfesionalInstitucion> GetAll()
        {
            using (var context = new YanaContext())
            {
                List<ProfesionalInstitucion> profesionalInstitucion = (from ctx in context.ProfesionalInstitucion
                                                                       where !ctx.BajaLogica
                                                                       select ctx).ToList();
                return profesionalInstitucion;
            }
        }

        public int Insert(ProfesionalInstitucion entity)
        {
            using (var context = new YanaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.ProfesionalInstitucion.Add(entity);
                context.SaveChanges();

                return entity.IdProfesionalInstitucion;
            }
        }

        public void Update(ProfesionalInstitucion entity)
        {
            using (var context = new YanaContext())
            {
                ProfesionalInstitucion profesionalInstitucion = (from ctx in context.ProfesionalInstitucion
                                                                 where !ctx.BajaLogica
                                                                 && ctx.IdProfesionalInstitucion == entity.IdProfesionalInstitucion
                                                                 select ctx).FirstOrDefault();
                if(profesionalInstitucion !=null)
                {
                    profesionalInstitucion.IdInstitucion = entity.IdInstitucion;
                    profesionalInstitucion.IdProfesional = entity.IdProfesional;

                    profesionalInstitucion.FechaModificacion = DateTime.Now;
                    profesionalInstitucion.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public List<ProfesionalInstitucion> GetProfesionalesByInstitucion(int idInstitucionUsuario)
        {
            using (var context = new YanaContext())
            {
                List<ProfesionalInstitucion> profesionalInstitucion = (from ctx in context.ProfesionalInstitucion
                                                                       where !ctx.BajaLogica
                                                                            && ctx.IdInstitucion == idInstitucionUsuario
                                                                       select ctx).ToList();
                return profesionalInstitucion;
            }
        }
    }
}
