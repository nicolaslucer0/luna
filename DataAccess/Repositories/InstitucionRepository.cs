using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;
using Yana.Utils;

namespace Yana.DataAccess.Repositories
{
    public class InstitucionRepository : IInstitucionRepository<Institucion>
    {
        public void Delete(int id)
        {
            using (var context = new LunaContext())
            {
                Institucion institucion = context.Institucion.FirstOrDefault(a => a.IdInstitucion == id);

                if (institucion != null)
                {
                    institucion.BajaLogica = true;
                    institucion.FechaModificacion = DateTime.Now;
                    institucion.IdUsuarioModificacion = UserCache.IdUsuario;
                }

                context.SaveChanges();
            }
        }

        public Institucion Get(int id)
        {
            using (var context = new LunaContext())
            {
                Institucion institucion = (from ctx in context.Institucion
                                           where !ctx.BajaLogica
                                                 && ctx.IdInstitucion == id
                                           select ctx).FirstOrDefault();

                return institucion;
            }
        }

        public List<Institucion> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<Institucion> institucion = (from ctx in context.Institucion
                                                 where !ctx.BajaLogica
                                                 select ctx).ToList();

                return institucion;
            }
        }

        public int Insert(Institucion entity)
        {
            using (var context = new LunaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;
                context.Institucion.Add(entity);

                context.SaveChanges();

                return entity.IdInstitucion;
            }
        }

        public void Update(Institucion entity)
        {
            using (var context = new LunaContext())
            {
                Institucion institucion = (from ctx in context.Institucion
                                           where !ctx.BajaLogica
                                                 && ctx.IdInstitucion == entity.IdInstitucion
                                           select ctx).FirstOrDefault();
                if (institucion != null)
                {
                    institucion.Nombre = entity.Nombre;
                    institucion.ProfesionalInstitucion = entity.ProfesionalInstitucion;
                    institucion.FontColor = entity.FontColor;
                    institucion.LogoUrl = entity.LogoUrl;
                    institucion.MainColor = entity.MainColor;
                    institucion.SecondaryColor = entity.SecondaryColor;
                    institucion.IdUsuarioModificacion = UserCache.IdUsuario;
                    institucion.FechaModificacion = DateTime.Now;
                }

                context.SaveChanges();
            }
        }
    }
}
