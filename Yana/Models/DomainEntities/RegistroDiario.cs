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

        public RegistroDiario(RegistroDiario r)
        {
            this.IdRegistroDiario = r.IdRegistroDiario;
            this.IdPaciente = r.IdPaciente;
            this.Situacion = r.Situacion;
            this.MotivoSituacion = r.MotivoSituacion;
            this.IdTipoEmocion = r.IdTipoEmocion;
            this.IntensidadEmocion = r.IntensidadEmocion;
            this.PensamientoAutomatico = r.PensamientoAutomatico;
            this.GradoCreenciaPensamientoAutomatico = r.GradoCreenciaPensamientoAutomatico;
            this.RespuestaRacional = r.RespuestaRacional;
            this.GradoCreenciaRespuestaRacional = r.GradoCreenciaRespuestaRacional;
            this.GradoCreenciaResultado = r.GradoCreenciaResultado;
            this.IdTipoEmocionResultado = r.IdTipoEmocionResultado;
            this.BajaLogica = r.BajaLogica;
            this.FechaModificacion = r.FechaModificacion;
            this.IdUsuarioModificacion = r.IdUsuarioModificacion;
            this.Seen = r.Seen;    
            this.IdTipoEmocionNavigation = r.IdTipoEmocionNavigation;
            this.IdTipoEmocionResultadoNavigation = r.IdTipoEmocionResultadoNavigation;
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
        public Boolean Seen { get; set; }

        public virtual Usuario IdPacienteNavigation { get; set; }
        public virtual TipoEmocion IdTipoEmocionNavigation { get; set; }
        public virtual TipoEmocion IdTipoEmocionResultadoNavigation { get; set; }
        public virtual ICollection<RegistroDiarioRespuesta> RegistroDiarioRespuesta { get; set; }
    }
}
