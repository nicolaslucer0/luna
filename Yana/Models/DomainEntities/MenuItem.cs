using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class MenuItem
    {
        public MenuItem()
        {
            InverseIdParentNavigation = new HashSet<MenuItem>();
            PerfilMenuItem = new HashSet<PerfilMenuItem>();
        }

        public int IdMenuItem { get; set; }
        public int? IdParent { get; set; }
        public int? Nivel { get; set; }
        public int? Orden { get; set; }
        public string Descripcion { get; set; }
        public string Controller { get; set; }
        public string Accion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual MenuItem IdParentNavigation { get; set; }
        public virtual ICollection<MenuItem> InverseIdParentNavigation { get; set; }
        public virtual ICollection<PerfilMenuItem> PerfilMenuItem { get; set; }
    }
}
