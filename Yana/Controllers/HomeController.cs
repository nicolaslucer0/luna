using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using BinserDashboard.Models.WrapperEntities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Yana.BusinessLogic.Services;
using Yana.BusinessLogic.Services.Utils;
using Yana.Enums;
using Yana.Helpers;
using Yana.Models;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;
using Yana.Utils.Utils.NotificacionesManager;

namespace Yana.Controllers
{
    public class HomeController : Controller
    {
        #region Constructor

        public HomeController()
        {
            this.StatisticService = new StatisticService();
            this.UsuarioService = new UsuarioService();
            this.NotificacionService = new NotificacionService();
            this.RegistroDiarioService = new RegistroDiarioService();
        }

        private StatisticService StatisticService { get; set; }
        private UsuarioService UsuarioService { get; set; }
        private NotificacionService NotificacionService { get; set; }
        private RegistroDiarioService RegistroDiarioService { get; set; }

        #endregion

        #region Home

        public IActionResult Index()
        {
            ViewBag.CantidadProfesionales = this.UsuarioService.GetCantidadUsuariosByPerfil(EnumPerfilUsuario.Profesional);
            ViewBag.CantidadPacientes = this.UsuarioService.GetCantidadUsuariosByPerfil(EnumPerfilUsuario.Paciente);
            ViewBag.CantidadNotificaciones = this.NotificacionService.GetTotalNotificaciones();
            ViewBag.CantidadRegistrosDiarios = this.RegistroDiarioService.GetTotalRegistrosDiarios();

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddEarlyAdopter(string email, int tipoAdopter)
        {
            if (ModelState.IsValid)

                try
                {
                    var earlyAdopterService = new EarlyAdopterService();
                    var adopter = new EarlyAdopter();

                    adopter.Email = email;
                    adopter.TipoEarlyAdopter = tipoAdopter;

                    earlyAdopterService.Insert(adopter);

                    //EmailService.SendMailNotificacionYana(adopter.Email);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    throw;
                }

            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddContact(string name, string email, string message)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var registroService = new RegistroNewsLetterService();
                    var registro = new RegistroNewsletter();

                    registro.Nombre = name;
                    registro.Email = email;
                    registro.Mensaje = message;

                    registroService.Insert(registro);

                    //EmailService.SendMailNotificacionYana(registro.Email);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    throw;
                }   
            }

            return RedirectToAction("Index");
        }

        #endregion

        #region Login

        [HttpGet]
        public ActionResult Login()
        {
            UserCache.MenuItems = null;

            if (string.IsNullOrEmpty(HttpContext.Session.GetString("IdUsuario")))
            {
                HttpContext.Session.SetString("IdUsuario", "IdCookie");
            }

            return View();
        }

        [HttpPost]
        public ActionResult Login(Usuario usuarioLogin)
        {
            if (ModelState.IsValid)
            {
                var usuarioService = new UsuarioService();
        
                Usuario usuario = usuarioService.Authenticate(usuarioLogin.Email, usuarioLogin.Password);
        
                if (usuario != null)
                {
                    UserCache.IdUsuario = usuario.IdUsuario;
                    UserCache.Email = usuario.Email;
                    UserCache.Nombre = usuario.Nombre;
                    UserCache.IdPerfil = Convert.ToInt32(usuario.IdPerfil);

                    if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Institucion))
                    {
                        UserCache.IdInstitucionUsuario = usuario.UsuarioInstitucion.Any()
                                                        ? Convert.ToInt32(usuario.UsuarioInstitucion.FirstOrDefault().IdInstitucion)
                                                        : 0;
                    }
                    else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Profesional))
                    {
                        UserCache.IdInstitucionUsuario = usuario.ProfesionalInstitucion.Any()
                                                        ? Convert.ToInt32(usuario.ProfesionalInstitucion.FirstOrDefault().IdInstitucion)
                                                        : 0;
                    }

                    ViewBag.Name = HttpContext.Session.GetString("IdUsuario");

                    List<MenuItemWrapper> menuItems = usuarioService.GetMenuItemsByUser(usuario.IdUsuario);

                    UserCache.MenuItems = menuItems;

                    NotificacionesManager.SendNotifications();

                    if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente))
                        return RedirectToAction("DashboardPaciente", "Paciente");

                    return View("GraficosSeguimiento");
                }
        
                ModelState.AddModelError("", "");
            }
        
            return View(usuarioLogin);
        }

        public ActionResult Logout()
        {
            UserCache.MenuItems = null;

            return RedirectToAction("Index", "Home");
        }

        public IActionResult Default()
        {
            if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente))
                return RedirectToAction("DashboardPaciente", "Paciente");

            return View("GraficosSeguimiento");
        }

        public IActionResult GraficosSeguimiento()
        {
            return View();
        }

        #endregion

        #region Statistics Graphs

        [HttpGet]
        public JsonResult GetRegistrosDiariosPorPaciente()
        {
            List<GraphSerieWrapper> graphSeries = this.StatisticService.GetCantidadRegistroDiarioByPaciente();

            JsonResult jsonResult = Json(graphSeries);

            return jsonResult;
        }

        [HttpGet]
        public JsonResult GetEmocionesUltimaSemana()
        {
            List<GraphSerieWrapper> graphSeries = this.StatisticService.GetGetEmocionesUltimaSemana();

            JsonResult jsonResult = Json(graphSeries);

            return jsonResult;
        }

        [HttpGet]
        public JsonResult GetRespuestasNotificaciones()
        {
            List<GraphSerieWrapper> graphSeries = this.StatisticService.GetRespuestasNotificaciones();

            JsonResult jsonResult = Json(graphSeries);

            return jsonResult;
        }

        [HttpGet]
        public JsonResult GetPacientesPorPatologia()
        {
            List<GraphSerieWrapper> graphSeries = this.StatisticService.GetPacientesPorPatologia();

            JsonResult jsonResult = Json(graphSeries);

            return jsonResult;
        }

        public IActionResult DispersionRegistroDiario()
        {
            DispersionGraphDataWrapper dispersionGraphDataWrapper = this.StatisticService.GetDispersionEdadPaciente();

            ViewBag.EdadPorPacienteFemenino = dispersionGraphDataWrapper.ArrayFemenino;
            ViewBag.EdadPorPacienteMasculino = dispersionGraphDataWrapper.ArrayMasculino;
            
            return View();
        }

        public IActionResult DispersionNotificacionesRespondidas()
        {
            DispersionGraphDataWrapper dispersionGraphDataWrapper = this.StatisticService.GetDispersionNotificaciones();

            ViewBag.NotiRespFemenino = dispersionGraphDataWrapper.ArrayFemenino;
            ViewBag.NotiRespMasculino  = dispersionGraphDataWrapper.ArrayMasculino;

            return View();
        }

        #endregion

        #region Public Methods


        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        #endregion

        #region Password Manager

        [HttpPost]
        public IActionResult ForgotPassword(string email)
        {
            UsuarioService usuarioService = new UsuarioService();

            Usuario usuarioRecuperacion = usuarioService.GetByEmail(email);

            if (usuarioRecuperacion != null)
            {
                EmailService.SendMailForgotPassword(email, usuarioRecuperacion);

                return Json(new { errorMessage = string.Empty });
            }

            TempData["messageERROR"] = "El mail ingresado no corresponde a con ningún usuario activo.";
            return Json(new { errorMessage = "Error" });
        }

        [HttpGet]
        public ActionResult RecoverPassword(string recover)
        {
            if (!string.IsNullOrWhiteSpace(recover))
            {
                UsuarioService service = new UsuarioService();

                Usuario usuario = service.GetUsuarioRecuperacion(recover);

                return View(usuario);
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult RecoverPassword(int idUsuario, string newPassword, string confirmPassword)
        {
            UsuarioService service = new UsuarioService();

            if (!string.IsNullOrEmpty(newPassword) && !string.IsNullOrEmpty(confirmPassword)
                && newPassword == confirmPassword)
            {
                service.ChangePasswordUsuario(idUsuario, newPassword);

                return RedirectToAction("Login");
            }

            Usuario usuario = service.GetById(idUsuario);

            TempData["messageERROR"] = "Las contraseñas ingresadas no coinciden.";
            return View(usuario);
        }

        #endregion
    }
}
