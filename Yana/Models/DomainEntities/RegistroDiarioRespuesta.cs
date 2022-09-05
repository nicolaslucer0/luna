using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class RegistroDiarioRespuesta
    {
        public int IdRegistroDiarioRespuesta { get; set; }
        public int? IdRegistroDiario { get; set; }
        public int? IdProfesional { get; set; }
        public string Nota { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Usuario IdProfesionalNavigation { get; set; }
        public virtual RegistroDiario IdRegistroDiarioNavigation { get; set; }
    }
}
