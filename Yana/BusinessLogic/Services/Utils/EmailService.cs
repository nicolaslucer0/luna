using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Yana.Helpers;
using Yana.Models.DomainEntities;
using Yana.Utils.Utils.EmailsManager;

namespace Yana.BusinessLogic.Services.Utils
{
    public class EmailService
    {
        public static void SendMailForgotPassword(string email, Usuario usuario)
        {
            var emailRespuesta = new EmailsManager
            {
                recipients = email,
                subject = "Recuperá tu contraseña",
                body = EmailsBodyGenerator.GetForgotPasswordBody(usuario)
            };

            emailRespuesta.SendEmail();
        }

        public static void SendMailNotificacionYana(string email)
        {
            var emailNotificacion = new EmailsManager
            {
                recipients = "yanapsico.oficial@gmail.com",
                subject = "Notificación",
                body = EmailsBodyGenerator.GetNotificacionBody(email)
            };

            emailNotificacion.SendEmail();
        }

        public static void SendMailNotificacionUsuario(Usuario usuario)
        {
            var emailNotificacion = new EmailsManager
            {
                //recipients = usuario.Email,
                recipients = "yanapsico.oficial@gmail.com",
                subject = "Nueva Notificación",
                body = EmailsBodyGenerator.GetNotificacionUsuarioBody(usuario)
            };

            emailNotificacion.SendEmail();
        }

    }
}
