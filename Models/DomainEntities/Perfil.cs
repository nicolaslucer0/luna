using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class Perfil
    {
        public Perfil()
        {
            PerfilMenuItem = new HashSet<PerfilMenuItem>();
            Usuario = new HashSet<Usuario>();
        }

        public int IdPerfil { get; set; }
        public string Nombre { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual ICollection<PerfilMenuItem> PerfilMenuItem { get; set; }
        public virtual ICollection<Usuario> Usuario { get; set; }
    }
}
