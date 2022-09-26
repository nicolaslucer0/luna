using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Yana.BusinessLogic.Services;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Utils.Exceptions;

namespace Yana.Controllers
{
    public class SeguimientoPacienteController : Controller
    {
        #region Constructor

        public SeguimientoPacienteController()
        {
            this.SeguimientoPacienteService = new SeguimientoPacienteService();
        }
        #endregion

        #region Properties

        private ISeguimientoPacienteService SeguimientoPacienteService { get; set; }

        #endregion

        #region SeguimientoPacienteList

        public IActionResult SeguimientoPacienteList(int idPaciente)
        {
            ViewBag.IdPaciente = idPaciente;

            return View();
        }

        #region JQGrid

        public JsonResult GetSeguimientoPaciente(string sidx, string sord, int page, int rows, bool _search, string filters, int idPaciente)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                IEnumerable<SeguimientoPaciente> seguimientoPaciente = this.SeguimientoPacienteService.GetByIdPaciente(idPaciente);

                var totalRecords = seguimientoPaciente.Count();

                return Json(new{ seguimientoPaciente });
            }
            catch (Exception ex)
            {
                TempData["messageERROR"] = "Se produjo un error en la aplicacion. " + ex.Message;
            }

            return new JsonResult(new { });
        }


        #endregion

        #endregion

        #region SeguimientoPacienteManager

        [HttpGet]
        public IActionResult SeguimientoPacienteManager(int idPaciente, int idSeguimientoPaciente)
        {
            if (idSeguimientoPaciente == 0)
                return View(new SeguimientoPaciente { IdPaciente = idPaciente });

            SeguimientoPaciente seguimientoPaciente = this.SeguimientoPacienteService.GetById(idSeguimientoPaciente);

            return View(seguimientoPaciente);
        }

        [HttpPost]
        public IActionResult SeguimientoPacienteManager(SeguimientoPaciente seguimientoPaciente)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    if (seguimientoPaciente.IdSeguimientoPaciente == 0)
                        this.SeguimientoPacienteService.Insert(seguimientoPaciente);
                    else
                        this.SeguimientoPacienteService.Update(seguimientoPaciente);

                    transactionScope.Complete();

                    return RedirectToAction("SeguimientoPacienteList", "SeguimientoPaciente", new { idPaciente = seguimientoPaciente.IdPaciente });
                }
                catch (GeneralValidationException ex)
                {
                    TempData["messageERROR"] = ex.Message;

                    transactionScope.Dispose();

                    return View("SeguimientoPacienteManager", seguimientoPaciente);
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;

                    transactionScope.Dispose();

                    return View("SeguimientoPacienteManager", seguimientoPaciente);
                }
            }
        }

        [HttpPost]
        public ActionResult DeleteSeguimientoPaciente(int idSeguimientoPaciente)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    this.SeguimientoPacienteService.Delete(idSeguimientoPaciente);

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

        #endregion
    }
}