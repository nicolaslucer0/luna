using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class GrupoFamiliar
    {
        public int IdGrupoFamiliar { get; set; }
        public int? IdPaciente { get; set; }
        public string Nombre { get; set; }
        public int? IdParentesco { get; set; }
        public string Observaciones { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Usuario IdPacienteNavigation { get; set; }
        public virtual Parentesco IdParentescoNavigation { get; set; }
    }
}
