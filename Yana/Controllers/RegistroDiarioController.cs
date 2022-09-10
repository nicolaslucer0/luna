using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Yana.BusinessLogic.Services;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.Enums;
using Yana.Helpers;
using Yana.Models.DomainEntities;
using Yana.Utils.Exceptions;

namespace Yana.Controllers
{
    public class RegistroDiarioController : Controller
    {
        #region Constructor

        public RegistroDiarioController()
        {
            this.RegistroDiarioService = new RegistroDiarioService();
            this.RegistroDiarioRespuestaService = new RegistroDiarioRespuestaService();
            this.TipoEmocionService = new TipoEmocionService();
        }

        #endregion

        #region Properties

        private IRegistroDiarioService RegistroDiarioService { get; set; }
        private IRegistroDiarioRespuestaService RegistroDiarioRespuestaService { get; set; }
        private ITipoEmocionService TipoEmocionService { get; set; }

        #endregion

        #region RegistroDiarioList

        public IActionResult RegistroDiarioList(int idPaciente)
        {
            ViewBag.IdPaciente = idPaciente;

            return View();
        }
        
        #region JQGrid

        public JsonResult GetRegistroDiario(string sidx, string sord, int page, int rows, bool _search, string filters, int idPaciente)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                IEnumerable<RegistroDiario> registroDiarios = this.RegistroDiarioService.GetAll();

                if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente))
                    registroDiarios = registroDiarios.Where(x => x.IdPaciente == UserCache.IdUsuario).ToList();
                else
                    registroDiarios = registroDiarios.Where(x => x.IdPaciente == idPaciente).ToList();

                var totalRecords = registroDiarios.Count();

                return Json(new {registroDiarios});

                
            }
            catch (Exception ex)
            {
                TempData["messageERROR"] = "Se produjo un error en la aplicacion. " + ex.Message;
            }

            return new JsonResult(new { });
            }

        #endregion

        #endregion

        #region RegistroDiarioManager

        [HttpGet]
        public ActionResult RegistroDiarioManager(int idRegistroDiario, int idPaciente)
        {
            if (idRegistroDiario == 0)
            {
                ViewBag.Emociones = this.GetTipoEmociones(0);
                ViewBag.EmocionesResultado = this.GetTipoEmociones(0);
                ViewBag.IdPaciente = idPaciente;

                return View(new RegistroDiario());
            }

            RegistroDiario registroDiario = this.RegistroDiarioService.GetById(idRegistroDiario);

            ViewBag.Emociones = this.GetTipoEmociones(Convert.ToInt32(registroDiario.IdTipoEmocion));
            ViewBag.EmocionesResultado = this.GetTipoEmociones(Convert.ToInt32(registroDiario.IdTipoEmocionResultado));
            ViewBag.IdPaciente = idPaciente;

            return View(registroDiario);
        }

        [HttpPost]
        public ActionResult RegistroDiarioManager(RegistroDiario registroDiario)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    if (registroDiario.IdRegistroDiario == 0)
                        this.RegistroDiarioService.Insert(registroDiario);

                    transactionScope.Complete();

                    return RedirectToAction("RegistroDiarioList", "RegistroDiario");
                }
                catch (GeneralValidationException ex)
                {
                    TempData["messageERROR"] = ex.Message;

                    transactionScope.Dispose();

                    ViewBag.Emociones = this.GetTipoEmociones(Convert.ToInt32(registroDiario.IdTipoEmocion));
                    ViewBag.EmocionesResultado = this.GetTipoEmociones(Convert.ToInt32(registroDiario.IdTipoEmocionResultado));

                    return View("RegistroDiarioManager", registroDiario);
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;

                    transactionScope.Dispose();

                    ViewBag.Emociones = this.GetTipoEmociones(Convert.ToInt32(registroDiario.IdTipoEmocion));
                    ViewBag.EmocionesResultado = this.GetTipoEmociones(Convert.ToInt32(registroDiario.IdTipoEmocionResultado));

                    return View("RegistroDiarioManager", registroDiario);
                }
            }
        }

        [HttpPost]
        public ActionResult RegistroDiarioRespuestaManager(RegistroDiarioRespuesta registroDiarioRespuesta)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    if (registroDiarioRespuesta.IdRegistroDiarioRespuesta == 0)
                        this.RegistroDiarioRespuestaService.Insert(registroDiarioRespuesta);
                    else
                        this.RegistroDiarioRespuestaService.Update(registroDiarioRespuesta);

                    transactionScope.Complete();

                    return RedirectToAction("RegistroDiarioList", "RegistroDiario", new { idPaciente = registroDiarioRespuesta.IdPaciente });
                }
                catch (GeneralValidationException ex)
                {
                    TempData["messageERROR"] = ex.Message;

                    transactionScope.Dispose();

                    return View("RegistroDiarioList");
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;

                    transactionScope.Dispose();

                    return View("RegistroDiarioList");
                }
            }
        }

        #endregion

        #region Helper Methods

        private IEnumerable<SelectListItem> GetTipoEmociones(int idTipoEmocion)
        {
            IEnumerable<TipoEmocion> tiposEmocion = this.TipoEmocionService.GetAll();

            IEnumerable<SelectListItem> items = tiposEmocion.ToList()
                .Select(c => new SelectListItem
                {
                    Value = c.IdTipoEmocion.ToString(),
                    Text = c.Descripcion,
                    Selected = (c.IdTipoEmocion == idTipoEmocion)
                });

            return items;
        }

        #endregion
    }
}