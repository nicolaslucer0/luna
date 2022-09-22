using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Yana.Models.WrapperEntities;

namespace Yana.Helpers
{
    public sealed class UserCache
    {
        private static readonly UserCache _instance = new UserCache();

        private UserCache()
        {
        }

        public static UserCache Instance
        {
            get
            {
                return _instance;
            }
        }

        public static int IdUsuario { get; set; }
        public static string Email { get; set; }
        public static int IdPerfil { get; set; }
        public static string Nombre { get; set; }
        public static List<MenuItemWrapper> MenuItems { get; set; }
        public static int IdInstitucionUsuario { get; set; }
    }
}
