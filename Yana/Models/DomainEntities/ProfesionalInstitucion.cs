using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class ProfesionalInstitucion
    {
        public int IdProfesionalInstitucion { get; set; }
        public int? IdProfesional { get; set; }
        public int? IdInstitucion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Institucion IdInstitucionNavigation { get; set; }
        public virtual Usuario IdProfesionalNavigation { get; set; }
    }
}
