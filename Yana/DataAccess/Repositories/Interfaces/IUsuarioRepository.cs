using System.Collections.Generic;
using Yana.Enums;
using Yana.Models.DomainEntities;

namespace Yana.DataAccess.Repositories.Interfaces
{
    public interface IUsuarioRepository<T> : IBaseRepository<Usuario>
    {
        Usuario GetByLogin(string email, string password);
        List<Usuario> GetPacientes();
        List<Usuario> GetPacientesWithRegistroDiario();
        List<Usuario> GetPacientesWithNotificaciones();
        int GetCantidadUsuariosByPerfil(EnumPerfilUsuario perfilUsuario);
    }
}
