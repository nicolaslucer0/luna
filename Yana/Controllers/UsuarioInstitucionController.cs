using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Yana.BusinessLogic.Services;
using Yana.Enums;
using Yana.Models.DomainEntities;
using Yana.Utils.Exceptions;

namespace Yana.Controllers
{
    public class UsuarioInstitucionController : Controller
    {
        #region Constructor

        public UsuarioInstitucionController()
        {
            this.UsuarioService = new UsuarioService();
            this.UsuarioInstitucionService = new UsuarioInstitucionService();
            this.InstitucionService = new InstitucionService();
        }

        private UsuarioService UsuarioService { get; set; }
        private UsuarioInstitucionService UsuarioInstitucionService { get; set; }
        private InstitucionService InstitucionService { get; set; }

        #endregion

        #region Usuarios Institucion List

        public IActionResult UsuarioInstitucionList()
        {
            return View();
        }

        #region JQGrid

        public JsonResult GetUsuariosInstitucion(string sidx, string sord, int page, int rows, bool _search, string filters)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                IEnumerable<Usuario> usuariosInstitucion = this.UsuarioService.GetByIdPerfil(EnumPerfilUsuario.Institucion);

                var totalRecords = usuariosInstitucion.Count();

                return Json(new
                {
                    usuarioInstitucion = (from item in usuariosInstitucion
                            select new
                            {
                                idusuario = item.IdUsuario,
                                nombre = item.Nombre,
                                apellido = item.Apellido
                            }).OrderByDescending(x => x.idusuario).ToArray()
                });

                
            }
            catch (Exception ex)
            {
                TempData["messageERROR"] = "Se produjo un error en la aplicacion. " + ex.Message;
            }

            return new JsonResult(new { });
        }

        #endregion

        #endregion

        #region UsuariosInstitucion Manager

        [HttpGet]
        public ActionResult UsuarioInstitucionManager(int id)
        {
            TempData["messageERROR"] = string.Empty;

            if (id == 0)
            {
                ViewBag.Sexos = this.GetSexos('\0');
                ViewBag.Instituciones = this.GetInstituciones(0);

                return View(new Usuario { IdPerfil = Convert.ToInt32(EnumPerfilUsuario.Institucion) });
            }

            Usuario usuario = this.UsuarioService.GetById(id);

            ViewBag.Sexos = this.GetSexos(usuario.Sexo != null ? Convert.ToChar(usuario.Sexo) : '\0');
            
            usuario.IdInstitucion = usuario.UsuarioInstitucion.Any() ? Convert.ToInt32(usuario.UsuarioInstitucion.FirstOrDefault().IdInstitucion) : 0;

            ViewBag.Instituciones = this.GetInstituciones(usuario.IdInstitucion);

            return View(usuario);
        }

        [HttpPost]
        public ActionResult UsuarioInstitucionManager(Usuario userInstitucion)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    if (userInstitucion.IdUsuario == 0)
                    {
                        Usuario usuarioExistente = this.UsuarioService.GetByEmail(userInstitucion.Email);

                        if (usuarioExistente != null)
                        {
                            TempData["messageERROR"] = "El email ingresado ya existe. Por favor, intente otro.";

                            transactionScope.Dispose();

                            ViewBag.Sexos = this.GetSexos(userInstitucion.Sexo != null ? Convert.ToChar(userInstitucion.Sexo) : '\0');
                            ViewBag.Instituciones = this.GetInstituciones(userInstitucion.IdInstitucion);

                            return View("UsuarioInstitucionManager", userInstitucion);
                        }

                        int idUsuarioInstitucion = this.UsuarioService.Insert(userInstitucion);

                        this.UsuarioInstitucionService.Insert(new UsuarioInstitucion
                        {
                            IdUsuario = idUsuarioInstitucion,
                            IdInstitucion = userInstitucion.IdInstitucion
                        });
                    }
                    else
                    {
                        this.UsuarioService.Update(userInstitucion);

                        this.UsuarioInstitucionService.Update(new UsuarioInstitucion
                        {
                            IdUsuario = userInstitucion.IdUsuario,
                            IdInstitucion = userInstitucion.IdInstitucion
                        });
                    }

                    transactionScope.Complete();

                    return RedirectToAction("UsuarioInstitucionList", "UsuarioInstitucion");
                }
                catch (GeneralValidationException ex)
                {
                    TempData["messageERROR"] = ex.Message;

                    transactionScope.Dispose();

                    ViewBag.Sexos = this.GetSexos(userInstitucion.Sexo != null ? Convert.ToChar(userInstitucion.Sexo) : '\0');
                    ViewBag.Instituciones = this.GetInstituciones(userInstitucion.IdInstitucion);

                    return View("UsuarioInstitucionManager", userInstitucion);
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;

                    transactionScope.Dispose();

                    ViewBag.Sexos = this.GetSexos(userInstitucion.Sexo != null ? Convert.ToChar(userInstitucion.Sexo) : '\0');
                    ViewBag.Instituciones = this.GetInstituciones(userInstitucion.IdInstitucion);

                    return View("UsuarioInstitucionManager", userInstitucion);
                }
            }
        }

        [HttpPost]
        public ActionResult DeleteUsuarioInstitucion(int idUsuarioInstitucion)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    this.UsuarioService.Delete(idUsuarioInstitucion);

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

        private IEnumerable<SelectListItem> GetInstituciones(int idInstitucion)
        {
            IEnumerable<Institucion> instituciones = this.InstitucionService.GetAll();

            IEnumerable<SelectListItem> items = instituciones.ToList()
                .Select(c => new SelectListItem
                {
                    Value = c.IdInstitucion.ToString(),
                    Text = c.Nombre,
                    Selected = (c.IdInstitucion == idInstitucion)
                });

            return items;
        }

        #endregion

        #endregion
    }
}