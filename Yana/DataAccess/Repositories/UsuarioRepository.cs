using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Yana.DataAccess.Repositories.Interfaces;
using Yana.Enums;
using Yana.Helpers;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;
using Yana.Utils;

namespace Yana.DataAccess.Repositories
{
    public class UsuarioRepository : IUsuarioRepository<Usuario>
    {
        public List<Usuario> GetAll()
        {
            using (var context = new LunaContext())
            {
                List<Usuario> usuarios = (from ctx in context.Usuario
                                          where !ctx.BajaLogica
                                          select ctx).ToList();
                return usuarios;
            }
        }

        public Usuario Get(int id)
        {
            using (var context = new LunaContext())
            {
                Usuario usuario = (from ctx in context.Usuario
                                        .Include(x => x.ProfesionalInstitucion)
                                        .Include(x => x.UsuarioInstitucion)
                                   where !ctx.BajaLogica
                                        && ctx.IdUsuario == id
                                   select ctx).FirstOrDefault();
                return usuario;
            }
        }

        public int Insert(Usuario entity)
        {
            using (var context = new LunaContext())
            {
                entity.Password = Sha1.Encode(entity.Dni.ToString());

                entity.BajaLogica = false;
                entity.FechaModificacion = DateTime.Now;
                entity.IdUsuarioModificacion = UserCache.IdUsuario;

                context.Usuario.Add(entity);
                context.SaveChanges();

                return entity.IdUsuario;
            }
        }

        internal IEnumerable<Usuario> GetByIdPerfil(EnumPerfilUsuario perfilUsuario)
        {
            using (var context = new LunaContext())
            {
                List<Usuario> usuarios = (from ctx in context.Usuario
                                            .Include(x => x.ProfesionalInstitucion)
                                            .Include(x => x.UsuarioInstitucion)
                                            .Include(x => x.ProfesionalPacienteIdPacienteNavigation)
                                          where !ctx.BajaLogica
                                            && ctx.IdPerfil == (int)perfilUsuario
                                          select ctx).ToList();
                return usuarios;
            }
        }

        public void Update(Usuario entity)
        {
            using (var context = new LunaContext())
            {
                Usuario usuario = (from ctx in context.Usuario
                                   where !ctx.BajaLogica
                                   && ctx.IdUsuario == entity.IdUsuario
                                   select ctx).FirstOrDefault();

                if (usuario != null)
                {
                    usuario.Apellido = entity.Apellido;
                    usuario.Celular = entity.Celular;
                    usuario.Dni = entity.Dni;
                    usuario.DomicilioUsuario = entity.DomicilioUsuario;
                    usuario.Email = entity.Email;
                    usuario.Nombre = entity.Nombre;
                    usuario.Password = entity.Password;
                    usuario.TelefonoParticular = entity.TelefonoParticular;
                    usuario.GrupoFamiliar = entity.GrupoFamiliar;
                    usuario.Sexo = entity.Sexo;
                    usuario.FechaNacimiento = entity.FechaNacimiento;

                    usuario.IdUsuarioModificacion = UserCache.IdUsuario;
                    usuario.FechaModificacion = DateTime.Now;
                }
                context.SaveChanges();
            }
        }

        public void Delete(int id)
        {
            using (var context = new LunaContext())
            {
                Usuario usuario = context.Usuario.FirstOrDefault(a => a.IdUsuario == id);
                
                if(usuario!=null)
                {
                    usuario.BajaLogica = true;
                    usuario.FechaModificacion = DateTime.Now;
                    usuario.IdUsuarioModificacion = UserCache.IdUsuario;
                }
                context.SaveChanges();
            }
        }

        public Usuario GetByLogin(string email, string password)
        {
            string encodePassword = Sha1.Encode(password);

            using (var context = new LunaContext())
            {
                Usuario usuario = (from ctx in context.Usuario
                                        .Include(x => x.UsuarioInstitucion)
                                   where !ctx.BajaLogica
                                         && ctx.Email == email
                                         && ctx.Password == encodePassword
                                   select ctx).FirstOrDefault();

                return usuario;
            }
        }

        public List<MenuItemWrapper> GetMenuItemsByUser(int idUsuario)
        {
            using (var context = new LunaContext())
            {
                List<int> perfilMenuItemsUser = context.Usuario
                                                    .Include(x => x.IdPerfilNavigation)
                                                        .ThenInclude(x => x.PerfilMenuItem)
                                                .Where(x => x.IdUsuario == idUsuario)
                                                    .SelectMany(x => x.IdPerfilNavigation.PerfilMenuItem)
                                                        .Select(m => m.IdMenuItem)
                                                .ToList();

                List<MenuItemWrapper> menuItems = context.MenuItem
                                                    .Include(x => x.IdParentNavigation)
                                                    .Where(x => perfilMenuItemsUser.Contains(x.IdMenuItem))
                                                    .Select(x => new MenuItemWrapper
                                                    {
                                                        IdMenuItem = x.IdMenuItem,
                                                        IdParent = x.IdParent,
                                                        Nivel = (int)x.Nivel,
                                                        Descripcion = x.Descripcion,
                                                        Controller = x.Controller,
                                                        Action = x.Accion,
                                                        Orden = (int)x.Nivel == 0 
                                                            ? x.Orden.ToString()
                                                            : string.Format("{0}-{1}", x.IdParent, x.Orden)
                                                    }).ToList();

                return menuItems;
            }
        }

        public Usuario GetByEmail(string email)
        {
            using (var context = new LunaContext())
            {
                Usuario usuario = (from ctx in context.Usuario
                    where !ctx.BajaLogica
                          && ctx.Email == email
                    select ctx).FirstOrDefault();
                return usuario;
            }
        }

        public List<Usuario> GetPacientes()
        {
            using (var context = new LunaContext())
            {
                List<Usuario> usuarios = (from ctx in context.Usuario
                                          where !ctx.BajaLogica
                                            && ctx.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente)
                                          select ctx).ToList();
                return usuarios;
            }
        }

        public List<Usuario> GetPacientesWithRegistroDiario()
        {
            using (var context = new LunaContext())
            {
                List<Usuario> usuarios = (from ctx in context.Usuario
                                            .Include(x => x.RegistroDiario)
                                          where !ctx.BajaLogica
                                                && ctx.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente)
                                          select ctx).ToList();
                return usuarios;
            }
        }

        public List<Usuario> GetPacientesWithNotificaciones()
        {
            using (var context = new LunaContext())
            {
                List<Usuario> usuarios = (from ctx in context.Usuario
                                            .Include(x => x.NotificacionIdPacienteNavigation)
                                          where !ctx.BajaLogica
                                                && ctx.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente)
                                          select ctx).ToList();
                return usuarios;
            }
        }

        public int GetCantidadUsuariosByPerfil(EnumPerfilUsuario perfilUsuario)
        {
            using (var context = new LunaContext())
            {
                int cantidadUsuarios = (from ctx in context.Usuario
                                        where !ctx.BajaLogica
                                          && ctx.IdPerfil == (int)perfilUsuario
                                        select ctx).Count();

                return cantidadUsuarios;
            }
        }
    }
}
