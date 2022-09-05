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
using Yana.Utils.Exceptions;

namespace Yana.Controllers
{
    public class PsicologoController : Controller
    {
        #region Constructor

        public PsicologoController()
        {
            this.UsuarioService = new UsuarioService();
            this.ProfesionalInstitucionService = new ProfesionalInstitucionService();
            this.InstitucionService = new InstitucionService();
        }

        private UsuarioService UsuarioService { get; set; }
        private ProfesionalInstitucionService ProfesionalInstitucionService { get; set; }
        private InstitucionService InstitucionService { get; set; }

        #endregion

        #region Psicologos List

        public IActionResult PsicologoList()
        {
            return View();
        }

        #region JQGrid

        public JsonResult GetPsicologos(string sidx, string sord, int page, int rows, bool _search, string filters)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                IEnumerable<Usuario> psicologos = this.UsuarioService.GetByIdPerfil(EnumPerfilUsuario.Profesional);

                List<Institucion> instituciones = this.InstitucionService.GetAll();

                if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Institucion))
                {
                    psicologos = psicologos.Where(x => x.ProfesionalInstitucion != null
                                                        && x.ProfesionalInstitucion.Any(y => y.IdInstitucion == UserCache.IdInstitucionUsuario)
                                                 ).ToList();
                }

                var totalRecords = psicologos.Count();

                JsonResult json = Json(new
                {
                    total = (totalRecords + rows - 1) / rows,
                    page,
                    records = totalRecords,
                    rows = (from item in psicologos
                            select new
                            {
                                idusuario = item.IdUsuario,
                                nombre = item.Nombre,
                                apellido = item.Apellido,
                                institucion = this.GetNombreInstitucion(item.ProfesionalInstitucion, instituciones)
                            }).OrderByDescending(x => x.idusuario).ToArray()
                });

                return json;
            }
            catch (Exception ex)
            {
                TempData["messageERROR"] = "Se produjo un error en la aplicacion. " + ex.Message;
            }

            return new JsonResult(new { });
        }

        private string GetNombreInstitucion(ICollection<ProfesionalInstitucion> profesionalInstituciones, List<Institucion> instituciones)
        {
            if (profesionalInstituciones.Any())
            {
                ProfesionalInstitucion profesionalInstitucion = profesionalInstituciones.FirstOrDefault();

                if (profesionalInstitucion != null)
                {
                    Institucion institucion = instituciones.FirstOrDefault(x => x.IdInstitucion == profesionalInstitucion.IdInstitucion);

                    if (institucion != null)
                        return institucion.Nombre;
                }
            }

            return "--";
        }

        #endregion

        #endregion

        #region Psicologo Manager

        [HttpGet]
        public ActionResult PsicologoManager(int id)
        {
            TempData["messageERROR"] = string.Empty;

            if (id == 0)
            {
                ViewBag.Sexos = this.GetSexos('\0');

                return View(new Usuario { IdPerfil = Convert.ToInt32(EnumPerfilUsuario.Profesional) });
            }

            Usuario usuario = this.UsuarioService.GetById(id);

            ViewBag.Sexos = this.GetSexos(usuario.Sexo != null ? Convert.ToChar(usuario.Sexo) : '\0');

            return View(usuario);
        }

        [HttpPost]
        public ActionResult PsicologoManager(Usuario userPsicologo)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    if (userPsicologo.IdUsuario == 0)
                    {
                        Usuario usuarioExistente = this.UsuarioService.GetByEmail(userPsicologo.Email);

                        if (usuarioExistente != null)
                        {
                            TempData["messageERROR"] = "El email ingresado ya existe. Por favor, intente otro.";

                            transactionScope.Dispose();

                            ViewBag.Sexos = this.GetSexos(userPsicologo.Sexo != null ? Convert.ToChar(userPsicologo.Sexo) : '\0');

                            return View("PsicologoManager", userPsicologo);
                        }

                        int idProfesional = this.UsuarioService.Insert(userPsicologo);

                        if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Institucion) && UserCache.IdInstitucionUsuario != 0)
                        {
                            this.ProfesionalInstitucionService.Insert(new ProfesionalInstitucion
                            {
                                IdInstitucion = UserCache.IdInstitucionUsuario,
                                IdProfesional = idProfesional
                            });
                        }
                    }
                    else
                    {
                        this.UsuarioService.Update(userPsicologo);
                    }

                    transactionScope.Complete();

                    return RedirectToAction("PsicologoList", "Psicologo");
                }
                catch (GeneralValidationException ex)
                {
                    TempData["messageERROR"] = ex.Message;

                    transactionScope.Dispose();

                    ViewBag.Sexos = this.GetSexos(userPsicologo.Sexo != null ? Convert.ToChar(userPsicologo.Sexo) : '\0');

                    return View("PsicologoManager", userPsicologo);
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;

                    transactionScope.Dispose();

                    ViewBag.Sexos = this.GetSexos(userPsicologo.Sexo != null ? Convert.ToChar(userPsicologo.Sexo) : '\0');

                    return View("PsicologoManager", userPsicologo);
                }
            }
        }

        [HttpPost]
        public ActionResult DeletePsicologo(int idPsicologo)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    this.UsuarioService.Delete(idPsicologo);

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