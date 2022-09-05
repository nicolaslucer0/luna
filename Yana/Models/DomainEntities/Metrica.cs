using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class Metrica
    {
        public int IdMetrica { get; set; }
        public string Descripcion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }
    }
}
