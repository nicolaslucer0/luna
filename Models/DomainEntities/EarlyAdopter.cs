using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class EarlyAdopter
    {
        public int IdEarlyAdopter { get; set; }
        public string Email { get; set; }
        public int TipoEarlyAdopter { get; set; }
        public DateTime FechaAlta { get; set; }
    }
}
