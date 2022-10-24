using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Threading.Tasks;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.DataAccess.Repositories;
using Yana.Enums;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;
using Yana.Utils;

namespace Yana.BusinessLogic.Services
{
    public class UsuarioService : IUsuarioService
    {
        private readonly UsuarioRepository _usuarioRepository;
        private readonly RegistroDiarioService registroDiarioService;

        public UsuarioService()
        {
            this._usuarioRepository = new UsuarioRepository();
            this.registroDiarioService = new RegistroDiarioService();
        }

        public Usuario Authenticate(string email, string password)
        {
            return this._usuarioRepository.GetByLogin(email, password);
        }

        public List<Usuario> GetAll()
        {
            return this._usuarioRepository.GetAll();
        }

        public Usuario GetByEmail(string email)
        {
            return this._usuarioRepository.GetByEmail(email);
        }

        public Usuario GetById(int id)
        {
            return this._usuarioRepository.Get(id);
        }

        public int Insert(Usuario entity)
        {
            return this._usuarioRepository.Insert(entity);
        }

        internal List<Usuario> GetByIdPerfil(EnumPerfilUsuario perfilUsuario)
        {
            return this._usuarioRepository.GetByIdPerfil(perfilUsuario);
        }

        public void Update(Usuario entity)
        {
            this._usuarioRepository.Update(entity);
        }

        public void Delete(int id)
        {
            this._usuarioRepository.Delete(id);
        }

        public List<MenuItemWrapper> GetMenuItemsByUser(int idUsuario)
        {
            return this._usuarioRepository.GetMenuItemsByUser(idUsuario);
        }

        public Usuario GetUsuarioRecuperacion(string recover)
        {
            string hashRecuperacion = Sha1.Encode("RecuperarContraseña");

            var recoverHash = recover.Split('-');

            if (hashRecuperacion == recoverHash[1])
            {
                int idusuario = Convert.ToInt32(recoverHash[0]);

                return this.GetById(idusuario);
            }

            return null;
        }

        public void ChangePasswordUsuario(int idUsuario, string newPassword)
        {
            Usuario usuario = this.GetById(idUsuario);

            if (usuario != null)
            {
                usuario.Password = Sha1.Encode(newPassword);

                this._usuarioRepository.Update(usuario);
            }
        }

        public int GetCantidadUsuariosByPerfil(EnumPerfilUsuario perfilUsuario)
        {
            return this._usuarioRepository.GetCantidadUsuariosByPerfil(perfilUsuario);
        }

        public List<Usuario> GetAllById(int id)
        {
            throw new NotImplementedException();
        }

        public int GetNotSeenRegistrosDiariosById (int id)
        {
            return this.registroDiarioService.GetNotSeenRegistrosDiariosByUserId(id);
        }
    }
}
