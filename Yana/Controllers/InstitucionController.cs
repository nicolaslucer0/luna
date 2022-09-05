using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using Microsoft.AspNetCore.Mvc;
using Yana.BusinessLogic.Services;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.Models.DomainEntities;
using Yana.Utils.Exceptions;
using Yana.Utils.Utils.NotificacionesManager;

namespace Yana.Controllers
{
    public class InstitucionController : Controller
    {
        #region Constructor

        public InstitucionController()
        {
            this.InstitucionService = new InstitucionService();
        }

        #endregion

        #region Properties

        private IInstitucionService InstitucionService { get; set; }

        #endregion

        #region InstitucionList

        public IActionResult InstitucionList()
        {
            TwilioManager.SendTwilioNotification();

            return View();
        }

        #region JQGrid

        public JsonResult GetInstituciones(string sidx, string sord, int page, int rows, bool _search, string filters)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                IEnumerable<Institucion> instituciones = this.InstitucionService.GetAll();

                var totalRecords = instituciones.Count();

                JsonResult json = Json(new
                {
                    total = (totalRecords + rows - 1) / rows,
                    page,
                    records = totalRecords,
                    rows = (from item in instituciones
                        select new
                        {
                            idinstitucion = item.IdInstitucion,
                            nombre = item.Nombre
                        }).OrderByDescending(x => x.idinstitucion).ToArray()
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

        #endregion

        #region InstitucionManager

        [HttpGet]
        public ActionResult InstitucionManager(int id)
        {
            if (id == 0)
                return View(new Institucion());

            Institucion institucion = this.InstitucionService.GetById(id);

            return View(institucion);
        }

        [HttpPost]
        public ActionResult InstitucionManager(Institucion institucion)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    if (institucion.IdInstitucion == 0)
                        this.InstitucionService.Insert(institucion);
                    else
                        this.InstitucionService.Update(institucion);

                    transactionScope.Complete();

                    return RedirectToAction("InstitucionList", "Institucion");
                }
                catch (GeneralValidationException ex)
                {
                    TempData["messageERROR"] = ex.Message;

                    transactionScope.Dispose();

                    return View("InstitucionManager", institucion);
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;

                    transactionScope.Dispose();

                    return View("InstitucionManager", institucion);
                }
            }
        }

        [HttpPost]
        public ActionResult DeleteInstitucion(int idInstitucion)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    this.InstitucionService.Delete(idInstitucion);

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