using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class Provincia
    {
        public Provincia()
        {
            Localidad = new HashSet<Localidad>();
        }

        public int IdProvincia { get; set; }
        public string Descripcion { get; set; }
        public int IdPais { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Pais IdPaisNavigation { get; set; }
        public virtual ICollection<Localidad> Localidad { get; set; }
    }
}
