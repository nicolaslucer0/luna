using System;
using System.Collections.Generic;
using System.Linq;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Helpers;

namespace Yana.DataAccess.Repositories
{
    public class UsuarioInstitucionRepository : IUsuarioInstitucionRepository<UsuarioInstitucion>
    {
        public void Delete(int id)
        {
            using (var context = new YanaContext())
            {
                UsuarioInstitucion usuarioInstitucion = context.UsuarioInstitucion.FirstOrDefault(a => a.IdUsuarioInstitucion == id);
                
                if (usuarioInstitucion !=null)
                {
                    usuarioInstitucion.BajaLogica = true;
                    usuarioInstitucion.IdUsuarioModificacion = UserCache.IdUsuario;
                    usuarioInstitucion.FechaModificacion = DateTime.Now;
                }

                context.SaveChanges();
            }
        }

        public UsuarioInstitucion Get(int id)
        {
            using (var context = new YanaContext())
            {
                UsuarioInstitucion usuarioInstitucion = (from ctx in context.UsuarioInstitucion
                                                                 where !ctx.BajaLogica
                                                                     && ctx.IdUsuarioInstitucion == id
                                                                 select ctx).FirstOrDefault();
                return usuarioInstitucion;
            }
        }

        public List<UsuarioInstitucion> GetAll()
        {
            using (var context = new YanaContext())
            {
                List<UsuarioInstitucion> usuarioInstitucion = (from ctx in context.UsuarioInstitucion
                                                                       where !ctx.BajaLogica
                                                                       select ctx).ToList();
                return usuarioInstitucion;
            }
        }

        public int Insert(UsuarioInstitucion entity)
        {
            using (var context = new YanaContext())
            {
                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.UsuarioInstitucion.Add(entity);
                context.SaveChanges();

                return entity.IdUsuarioInstitucion;
            }
        }

        public void Update(UsuarioInstitucion entity)
        {
            using (var context = new YanaContext())
            {
                UsuarioInstitucion usuarioInstitucion = (from ctx in context.UsuarioInstitucion
                                                         where !ctx.BajaLogica
                                                             && ctx.IdUsuario == entity.IdUsuario
                                                         select ctx).FirstOrDefault();

                if (usuarioInstitucion != null)
                {
                    usuarioInstitucion.IdUsuario = entity.IdUsuario;
                    usuarioInstitucion.IdInstitucion = entity.IdInstitucion;

                    usuarioInstitucion.FechaModificacion = DateTime.Now;
                    usuarioInstitucion.IdUsuarioModificacion = UserCache.IdUsuario;
                }

                context.SaveChanges();
            }
        }
    }
}
