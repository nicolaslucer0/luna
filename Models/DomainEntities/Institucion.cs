using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class Institucion
    {
        public Institucion()
        {
            ProfesionalInstitucion = new HashSet<ProfesionalInstitucion>();
            UsuarioInstitucion = new HashSet<UsuarioInstitucion>();
        }

        public int IdInstitucion { get; set; }
        public string Nombre { get; set; }
        public string MainColor { get; set; }
        public string SecondaryColor { get; set; }
        public string FontColor { get; set; }
        public string LogoUrl { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual ICollection<ProfesionalInstitucion> ProfesionalInstitucion { get; set; }
        public virtual ICollection<UsuarioInstitucion> UsuarioInstitucion { get; set; }
    }
}
