using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Yana.BusinessLogic.Services;
using Yana.Enums;
using Yana.Helpers;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;
using Yana.Utils.Exceptions;

namespace Yana.Controllers
{
    public class PacienteController : Controller
    {
        #region Constructor

        public PacienteController()
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

        #endregion

        #region PacienteList

        public IActionResult PacienteList()
        {
            return View();
        }

        #region JQGrid

        public JsonResult GetPacientes(string sidx, string sord, int page, int rows, bool _search, string filters)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                List<Usuario> pacientes = this.UsuarioService.GetByIdPerfil(EnumPerfilUsuario.Paciente);

                if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Profesional))
                {
                    pacientes = pacientes.Where(x =>  x.ProfesionalPacienteIdPacienteNavigation != null && x.ProfesionalPacienteIdPacienteNavigation.Any(y => y.IdProfesional == UserCache.IdUsuario)).ToList();
                    pacientes.ForEach(p => p.NotSeenNotifications = this.UsuarioService.GetNotSeenRegistrosDiariosById(p.IdUsuario));
                }

                return Json(pacientes);
                
            }
            catch (Exception ex)
            {
                TempData["messageERROR"] = "Se produjo un error en la aplicacion. " + ex.Message;
            }

            return new JsonResult(new { });
        }

        #endregion

        #endregion

        #region PacienteManager

        [HttpGet]
        public ActionResult PacienteManager(int id)
        {
            TempData["messageERROR"] = string.Empty;

            ViewBag.PerfilesUsuario = this.GetPerfilesUsuarios(UserCache.IdPerfil);

            if (id == 0)
            {
                ViewBag.Patologias = this.GetPatologias();
                ViewBag.Sexos = this.GetSexos('\0');

                return View(new Usuario { IdPerfil = Convert.ToInt32(EnumPerfilUsuario.Paciente) });
            }

            Usuario usuario = this.UsuarioService.GetById(id);

            ViewBag.Patologias = this.GetPatologias();
            ViewBag.Sexos = this.GetSexos(usuario.Sexo != null ? Convert.ToChar(usuario.Sexo) : '\0');
            
            return View(usuario);
        }

        [HttpPost]
        public ActionResult PacienteManager(Usuario paciente)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    if (paciente.IdUsuario == 0)
                    {
                        Usuario usuarioExistente = this.UsuarioService.GetByEmail(paciente.Email);

                        if (usuarioExistente != null)
                        {
                            TempData["messageERROR"] = "El email ingresado ya existe. Por favor, intente otro.";

                            transactionScope.Dispose();

                            ViewBag.Patologias = this.GetPatologias();
                            ViewBag.Sexos = this.GetSexos(paciente.Sexo != null ? Convert.ToChar(paciente.Sexo) : '\0');

                            return View("PacienteManager", paciente);
                        }

                        int idPaciente = this.UsuarioService.Insert(paciente);

                        if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Profesional))
                        {
                            this.ProfesionalPacienteService.Insert(new ProfesionalPaciente
                            {
                                IdProfesional = UserCache.IdUsuario,
                                IdPaciente = idPaciente
                            });
                        }
                    }
                    else
                    {
                        this.UsuarioService.Update(paciente);
                    }

                    this.PacientePatologiaService.SaveOrUpdateByPaciente(paciente);

                    transactionScope.Complete();

                    return RedirectToAction("PacienteList", "Paciente");
                }
                catch (GeneralValidationException ex)
                {
                    TempData["messageERROR"] = ex.Message;

                    transactionScope.Dispose();

                    ViewBag.Patologias = this.GetPatologias();
                    ViewBag.Sexos = this.GetSexos(paciente.Sexo != null ? Convert.ToChar(paciente.Sexo) : '\0');

                    return View("PacienteManager", paciente);
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;

                    transactionScope.Dispose();

                    ViewBag.Patologias = this.GetPatologias();
                    ViewBag.Sexos = this.GetSexos(paciente.Sexo != null ? Convert.ToChar(paciente.Sexo) : '\0');

                    return View("PacienteManager", paciente);
                }
            }
        }

        [HttpPost]
        public ActionResult DeletePaciente(int idPaciente)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    this.UsuarioService.Delete(idPaciente);

                    transactionScope.Complete();

                    return Json(new { errorMessage = string.Empty });
                }
                catch (GeneralValidationException ex)
                {
                    TempData["messageERROR"] = ex.Message;

                    transactionScope.Dispose();

                    return Json(new { errorMessage = ex.Message });
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;

                    transactionScope.Dispose();

                    return Json(new { errorMessage = ex.Message });
                }
            }
        }

        public JsonResult GetPatologiasByIdPaciente(string sidx, string sord, int page, int rows, bool _search, string filters, int idPaciente)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                List<Patologia> actividadSintomas = this.PatologiaService.GetByIdPaciente(idPaciente).ToList();

                var totalRecords = actividadSintomas.Count;

                JsonResult json = Json(new
                {
                    total = (totalRecords + rows - 1) / rows,
                    page,
                    records = totalRecords,
                    rows = (from item in actividadSintomas
                        select new
                        {
                            idPatologia = item.IdPatologia,
                            nombrePatologia = item.Nombre
                        }).ToArray()
                });

                return json;
            }
            catch (Exception ex)
            {
                TempData["messageERROR"] = "Se produjo un error en la aplicacion. " + ex.Message;
            }

            return new JsonResult(new { });
        }

        #endregion

        #region Dashboard Paciente

        public IActionResult DashboardPaciente()
        {
            List<EnumEstadoNotificacion> estadosNotificacionPendientes = new List<EnumEstadoNotificacion>
            {
                EnumEstadoNotificacion.Entregada
            };

            List<Notificacion> notificacionesPendientes = this.NotificacionService.GetByPacienteYEstados(UserCache.IdUsuario, estadosNotificacionPendientes);

            return View(notificacionesPendientes);
        }

        #endregion

        #region Helper Methods

        private IEnumerable<SelectListItem> GetPerfilesUsuarios(int idPerfilUsuario)
        {
            IEnumerable<Perfil> perfilesUsuario = this.PerfilService.GetAll();

            IEnumerable<SelectListItem> items = perfilesUsuario.ToList()
                .Select(c => new SelectListItem
                {
                    Value = c.IdPerfil.ToString(),
                    Text = c.Nombre,
                    Selected = (c.IdPerfil == idPerfilUsuario)
                });

            return items;
        }

        private IEnumerable<SelectListItem> GetPatologias()
        {
            IEnumerable<Patologia> patologias = this.PatologiaService.GetAll();

            IEnumerable<SelectListItem> items = patologias.ToList()
                .Select(c => new SelectListItem
                {
                    Value = c.IdPatologia.ToString(),
                    Text = c.Nombre
                });

            return items;
        }

        #region Helper Methods

        private IEnumerable<SelectListItem> GetSexos(char sexo)
        {
            var sexos = new List<SelectListItem>
            { 
                new SelectListItem { Value = "M", Text = "Masculino" },  
                new SelectListItem { Value = "F", Text = "Femenino" }
            };

            IEnumerable<SelectListItem> items = sexos.ToList()
                .Select(c => new SelectListItem
                {
                    Value = c.Value.ToString(),
                    Text = c.Text,
                    Selected = (c.Value == sexo.ToString())
                });

            return items;
        }

        #endregion

        #endregion
    }
}