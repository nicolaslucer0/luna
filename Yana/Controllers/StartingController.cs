using System;
using Yana.BusinessLogic.Services;

namespace Yana.Controllers
{
    public class StartingController
    {
        public StartingController()
        {
            this.UsuarioService = new UsuarioService();
            this.PerfilService = new PerfilService();
            this.PatologiaService = new PatologiaService();
            this.PacientePatologiaService = new PacientePatologiaService();
            this.NotificacionService = new NotificacionService();
            this.ProfesionalPacienteService = new ProfesionalPacienteService();      
    }
        private UsuarioService UsuarioService { get; set; }
        private PerfilService PerfilService { get; set; }
        private PatologiaService PatologiaService { get; set; }
        private PacientePatologiaService PacientePatologiaService { get; set; }
        private NotificacionService NotificacionService { get; set; }
        private ProfesionalPacienteService ProfesionalPacienteService { get; set; }
    }
}

