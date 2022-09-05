using Yana.Enums;
using Yana.Models.DomainEntities;

namespace Yana.BusinessLogic.Services.Interfaces
{
    public interface IUsuarioService : IBaseService<Usuario>
    {
        Usuario Authenticate(string email, string password);
        Usuario GetByEmail(string email);
        void ChangePasswordUsuario(int idUsuario, string newPassword);
        int GetCantidadUsuariosByPerfil(EnumPerfilUsuario perfilUsuario);
    }
}
