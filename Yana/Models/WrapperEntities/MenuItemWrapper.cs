using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Yana.Models.WrapperEntities
{
    public class MenuItemWrapper
    {
        public int IdMenuItem { get; set; }
        public int? IdParent { get; set; }
        public int Nivel { get; set; }
        public string Descripcion { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string Orden { get; set; }
        public List<MenuItemWrapper> childs { get; set; }
    }

}
