using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class RegistroDiario
    {
        public RegistroDiario()
        {
            RegistroDiarioRespuesta = new HashSet<RegistroDiarioRespuesta>();
        }

        public int IdRegistroDiario { get; set; }
        public int? IdPaciente { get; set; }
        public string Situacion { get; set; }
        public string MotivoSituacion { get; set; }
        public int? IdTipoEmocion { get; set; }
        public int? IntensidadEmocion { get; set; }
        public string PensamientoAutomatico { get; set; }
        public int? GradoCreenciaPensamientoAutomatico { get; set; }
        public string RespuestaRacional { get; set; }
        public int? GradoCreenciaRespuestaRacional { get; set; }
        public int? GradoCreenciaResultado { get; set; }
        public int? IdTipoEmocionResultado { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Usuario IdPacienteNavigation { get; set; }
        public virtual TipoEmocion IdTipoEmocionNavigation { get; set; }
        public virtual TipoEmocion IdTipoEmocionResultadoNavigation { get; set; }
        public virtual ICollection<RegistroDiarioRespuesta> RegistroDiarioRespuesta { get; set; }
    }
}
