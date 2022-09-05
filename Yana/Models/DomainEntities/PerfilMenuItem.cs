using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class PerfilMenuItem
    {
        public int IdPerfilMenuItem { get; set; }
        public int IdPerfil { get; set; }
        public int IdMenuItem { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual MenuItem IdMenuItemNavigation { get; set; }
        public virtual Perfil IdPerfilNavigation { get; set; }
    }
}
