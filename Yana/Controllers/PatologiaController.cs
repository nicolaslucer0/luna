using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Yana.BusinessLogic.Services;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.Helpers;
using Yana.Models.DomainEntities;
using Yana.Utils.Exceptions;
using Newtonsoft.Json;

namespace Yana.Controllers
{
    public class PatologiaController : Controller
    {
        #region Constructor

        public PatologiaController()
        {
            this.PatologiaService = new PatologiaService();
        }

        #endregion

        #region Properties

        private IPatologiaService PatologiaService { get; set; }

        #endregion

        #region PatologiaList

        public IActionResult PatologiaList()
        {
            return View();
        }

        #region JQGrid

        public JsonResult GetPatologias(string sidx, string sord, int page, int rows, bool _search, string filters)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                IEnumerable<Patologia> patologias = this.PatologiaService.GetAll();

                var totalRecords = patologias.Count();

                return Json(new{ patologias });

            }
            catch (Exception ex)
            {
                TempData["messageERROR"] = "Se produjo un error en la aplicacion. " + ex.Message;
            }

            return new JsonResult(new { });
        }

        #endregion

        #endregion

        #region Patologia Manager

        [HttpGet]
        public ActionResult PatologiaManager(int id)
        {
            if (id == 0)
                return View(new Patologia());

            Patologia patologia = this.PatologiaService.GetById(id);

            return View(patologia);
        }

        [HttpPost]
        public ActionResult PatologiaManager(Patologia patologia)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    if (patologia.IdPatologia == 0)
                        this.PatologiaService.Insert(patologia);
                    else
                        this.PatologiaService.Update(patologia);

                    transactionScope.Complete();

                    return RedirectToAction("PatologiaList", "Patologia");
                }
                catch (GeneralValidationException ex)
                {
                    TempData["messageERROR"] = ex.Message;

                    transactionScope.Dispose();

                    return View("PatologiaManager", patologia);
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;

                    transactionScope.Dispose();

                    return View("PatologiaManager", patologia);
                }
            }
        }

        [HttpPost]
        public ActionResult DeletePatologia(int idPatologia)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    this.PatologiaService.Delete(idPatologia);

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