using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class Usuario
    {
        public Usuario()
        {
            DomicilioUsuario = new HashSet<DomicilioUsuario>();
            GrupoFamiliar = new HashSet<GrupoFamiliar>();
            NotificacionIdPacienteNavigation = new HashSet<Notificacion>();
            NotificacionIdProfesionalNavigation = new HashSet<Notificacion>();
            PacientePatologia = new HashSet<PacientePatologia>();
            ProfesionalInstitucion = new HashSet<ProfesionalInstitucion>();
            ProfesionalPacienteIdPacienteNavigation = new HashSet<ProfesionalPaciente>();
            ProfesionalPacienteIdProfesionalNavigation = new HashSet<ProfesionalPaciente>();
            RegistroDiario = new HashSet<RegistroDiario>();
            RegistroDiarioRespuesta = new HashSet<RegistroDiarioRespuesta>();
            SeguimientoPacienteIdPacienteNavigation = new HashSet<SeguimientoPaciente>();
            SeguimientoPacienteIdProfesionalNavigation = new HashSet<SeguimientoPaciente>();
            UsuarioInstitucion = new HashSet<UsuarioInstitucion>();
        }

        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int? Dni { get; set; }
        public string TelefonoParticular { get; set; }
        public string Celular { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int? IdPerfil { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public string Sexo { get; set; }

        public virtual Perfil IdPerfilNavigation { get; set; }
        public virtual ICollection<DomicilioUsuario> DomicilioUsuario { get; set; }
        public virtual ICollection<GrupoFamiliar> GrupoFamiliar { get; set; }
        public virtual ICollection<Notificacion> NotificacionIdPacienteNavigation { get; set; }
        public virtual ICollection<Notificacion> NotificacionIdProfesionalNavigation { get; set; }
        public virtual ICollection<PacientePatologia> PacientePatologia { get; set; }
        public virtual ICollection<ProfesionalInstitucion> ProfesionalInstitucion { get; set; }
        public virtual ICollection<ProfesionalPaciente> ProfesionalPacienteIdPacienteNavigation { get; set; }
        public virtual ICollection<ProfesionalPaciente> ProfesionalPacienteIdProfesionalNavigation { get; set; }
        public virtual ICollection<RegistroDiario> RegistroDiario { get; set; }
        public virtual ICollection<RegistroDiarioRespuesta> RegistroDiarioRespuesta { get; set; }
        public virtual ICollection<SeguimientoPaciente> SeguimientoPacienteIdPacienteNavigation { get; set; }
        public virtual ICollection<SeguimientoPaciente> SeguimientoPacienteIdProfesionalNavigation { get; set; }
        public virtual ICollection<UsuarioInstitucion> UsuarioInstitucion { get; set; }
    }
}
