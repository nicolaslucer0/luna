using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Yana.Models.DomainEntities;

namespace Yana.Utils.Utils.EmailsManager
{
    public class EmailsBodyGenerator
    {
        public static string GetForgotPasswordBody(Usuario usuario)
        {
            var body = new StringBuilder();

            var hashRecuperacion = string.Format("{0}-{1}", usuario.IdUsuario.ToString() ,Sha1.Encode("RecuperarContraseña")) ;
            string linkRecuperacion = "https://yana.com.ar/Home/RecoverPassword?recover=" + hashRecuperacion;

            body.Append("<html><head><title>Recuperá tu clave</title>");
            body.Append("<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'></head>");
            body.Append("<body style='background-color:lightgray'>");
            body.Append("<div style='background-color:white; width:60%; margin:auto; padding-bottom:30px;'>");
            body.Append("<img src='https://yana.com.ar/img/logoYana.png' style='width: 249px; height:27px; padding:20px; padding-bottom: 0px;'/>");
            body.Append("<div style='padding: 40px;'>");
            body.Append("<h2 style='color:#0eb493 ; font-size:20px; padding-bottom:10px; font-weight: 800; text-transform: uppercase; font-family: 'Montserrat'; text-align:center; border-bottom: solid 2px #ddd'>");
            body.Append("Restablecer contraseña</h2>");
            body.Append("<p style='font-family: Calibri; font-size: 18px;'>");
            body.Append(usuario.Nombre);
            body.Append("<br/>");
            body.Append("Alguien ha pedido restablecer la contraseña de tu cuenta. <br/>");
            body.Append("Si no solicitaste un restablecimiento de contraseña, podés ignorar este correo electrónico.");
            body.Append("No se han realizado cambios en tu cuenta.");
            body.Append("<br/>");
            body.Append("Para restablecer tu contraseña, hacé clic este enlace(o pegalo en tu navegador):");
            body.Append("<br/>");
            body.Append(linkRecuperacion);
            body.Append("<br/> <br/>");
            body.Append("Equipo de YANA");
            body.Append("</p>");
            body.Append("</div>");
            body.Append("</div>");
            body.Append("<p style='font-size: 12px; text-align:center; font-family: Calibri; color: #5b646e'> Este correo electrónico automático fue enviado a");
            body.Append($" {usuario.Nombre} {usuario.Apellido}({usuario.Email}) ");
            body.Append("con respecto a su cuenta de YANA.</p>");
            body.Append("</body>");
            body.Append("</html>");
            
            return body.ToString();
        }

        internal static string GetNotificacionUsuarioBody(Usuario usuario)
        {
            var body = new StringBuilder();

            body.Append("<html><head><title>Notificación</title>");
            body.Append("<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'></head>");
            body.Append("<body style='background-color:lightgray'>");
            body.Append("<div style='background-color:white; width:60%; margin:auto;'>");
            body.Append("<img src='https://yana.com.ar/img/logoYana.png' style='width: 249px; height:27px; padding:20px; padding-bottom: 0px;'/>");
            body.Append("<div style='padding: 40px;'>");
            body.Append("<h2 style='color:#0eb493 ; font-size:20px; font-weight: 800; text-transform: uppercase; text-align:center; border-bottom: solid 2px #ddd; font-family: 'Montserrat';'>");
            body.Append("Tenés una nueva notificación de Yana:</h2>");
            body.Append("<p style='font-family: Calibri; font-size: 18px;'>");
            body.Append("<br/>");
            body.Append("Para responderla hacé click en el siguiente link: <br/>");
            body.Append("https://yana.com.ar/Home/Login");
            body.Append("<br/> <br/> ");
            body.Append("Equipo de YANA");
            body.Append("</p>");
            body.Append("</div>");
            body.Append("</div>");
            body.Append("<p style='font-size: 12px; text-align:center; font-family: Calibri; color: #5b646e'> Este correo electrónico automático fue enviado a");
            body.Append("con respecto a su cuenta de YANA.</p>");
            body.Append("</body>");
            body.Append("</html>");

            return body.ToString();
        }

        internal static string GetNotificacionBody(string email)
        {
            var body = new StringBuilder();

            body.Append("<html><head><title>Notificación</title>");
            body.Append("<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'></head>");
            body.Append("<body style='background-color:lightgray'>");
            body.Append("<div style='background-color:white; width:60%; margin:auto; padding-bottom:30px;'>");
            body.Append("<img src='https://yana.com.ar/img/logoYana.png' style='width: 249px; height:27px; padding:20px; padding-bottom: 0px;'/>");
            body.Append("<div style='padding: 40px;'>");
            body.Append("<h2 style='color:#0eb493 ; font-size:20px; padding-bottom:10px; font-weight: 800; text-transform: uppercase; font-family: 'Montserrat'; text-align:center; border-bottom: solid 2px #ddd'>");
            body.Append("Hay un nuevo interesado en Yana:</h2>");
            body.Append("<p style='font-family: Calibri; font-size: 18px;'>");
            body.Append("<br/>");
            body.Append("La persona se ha registrado con el email: <br/>");
            body.Append(email);
            body.Append("<br/><br/>");
            body.Append("Equipo de YANA");
            body.Append("</p>");
            body.Append("</div>");
            body.Append("</div>");
            body.Append("<p style='font-size: 12px; text-align:center; font-family: Calibri; color: #5b646e'> Este correo electrónico automático fue enviado a");
            body.Append("con respecto a su cuenta de YANA.</p>");
            body.Append("</body>");
            body.Append("</html>");

            return body.ToString();
        }
    }
}
