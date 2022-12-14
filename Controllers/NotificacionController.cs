using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;
using Microsoft.AspNetCore.Mvc;
using Yana.BusinessLogic.Services;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.Enums;
using Yana.Helpers;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;
using Yana.Utils.Exceptions;

namespace Yana.Controllers
{
    public class NotificacionController : Controller
    {
        #region Constructor

        public NotificacionController()
        {
            this.NotificacionService = new NotificacionService();
            this.NotificacionOpcionService = new NotificacionOpcionService();
            this.NotificacionRespuestaService = new NotificacionRespuestaService();
        }

        #endregion

        #region Properties

        private INotificacionService NotificacionService { get; set; }
        private NotificacionOpcionService NotificacionOpcionService { get; set; }
        private INotificacionRespuestaService NotificacionRespuestaService { get; set; }

        #endregion

        #region NotificacionList

        public IActionResult NotificacionList(int idPaciente)
        {
            try
            {
                Usuario paciente = this.NotificacionService.GetPacienteById(idPaciente);
                ViewBag.IdPaciente = idPaciente;
                ViewBag.NombrePaciente = paciente.Nombre;

                return View();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return RedirectToAction("PacienteList", "Paciente");
            }
        }

        #region JQGrid

        public JsonResult GetNotificaciones(string sidx, string sord, int page, int rows, bool _search, string filters, int idPaciente)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                IEnumerable<Notificacion> notificaciones = this.NotificacionService.GetNotificacionesProfesionalAndPaciente(UserCache.IdUsuario, idPaciente);

                if (notificaciones != null)
                {
                    JsonResult json = Json(new
                    {
                        notificaciones = (from item in notificaciones
                                          select new
                                          {
                                              idNotificacion = item.IdNotificacion,
                                              fecha = item.FechaHora,
                                              mensaje = item.Mensaje,
                                              estado = item.IdEstadoNotificacionNavigation.Descripcion,
                                              respuesta = getRespuesta(item),
                                              descripcion = getComentario(item)
                                          }).OrderByDescending(x => x.fecha).ToArray()
                    });

                    return json;
                }
            }
            catch (Exception ex)
            {
                TempData["messageERROR"] = "Se produjo un error en la aplicacion. " + ex.Message;
            }

            return new JsonResult(new { });
        }


        public int GetNotificacionesCount(int estado)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;
                int notificaciones = this.NotificacionService.CountNotificationsByProfesionalAndStatus(UserCache.IdUsuario, estado);
            }
            catch (Exception ex)
            {
                TempData["messageERROR"] = "Se produjo un error en la aplicacion. " + ex.Message;
            }

            return 0;
        }


        private string getRespuesta(Notificacion notificacion)
        {
            if (notificacion.NotificacionRespuesta.Any())
            {
                NotificacionRespuesta notificacionRespuesta = notificacion.NotificacionRespuesta.FirstOrDefault();
                if (notificacionRespuesta != null)
                {
                    NotificacionOpcion notificacionOpcion = notificacionRespuesta.IdNotificacionOpcionNavigation;
                    if (notificacionOpcion != null)
                        return notificacionOpcion.Descripcion;
                }
            }
            return "";
        }
        private string getComentario(Notificacion notificacion)
        {

            if (notificacion.NotificacionRespuesta.Any())
            {
                NotificacionRespuesta notificacionRespuesta = notificacion.NotificacionRespuesta.FirstOrDefault();
                if (notificacionRespuesta != null)
                {
                    NotificacionOpcion notificacionOpcion = notificacionRespuesta.IdNotificacionOpcionNavigation;                    
                    if (!string.IsNullOrEmpty(notificacionRespuesta.Respuesta))
                        return notificacionRespuesta.Respuesta;
                }
            }
            return "";
        }

        #endregion

        #endregion

        #region Notificacion Manager

        [HttpGet]
        public ActionResult NotificacionManager(int idNotificacion, int idPaciente)
        {
            var _context = new LunaContext();

            if (idNotificacion == 0)
            {
                return View(new NotificacionWrapper()
                {
                    IdPaciente = idPaciente,
                    CantDias = 1
                });
            }

            NotificacionWrapper notificacion = this.NotificacionService.GetNotificacionWrapperById(idNotificacion);

            if (notificacion.IdGrupo != null)
                TempData["messageWARNING"] = "La notificación seleccionada tiene otras asociadas, los cambios que se realicen en la misma generará la baja de las demas.";

            return View(notificacion);
        }

        [HttpPost]
        public ActionResult NotificacionManager(NotificacionWrapper notificacion)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    int auxId = notificacion.IdNotificacion;

                    if (notificacion.Copia)
                        notificacion.IdNotificacion = 0;

                    if (notificacion.IdNotificacion == 0)
                    {
                        if (!this.NotificacionService.ValidarNotificaciones(notificacion))
                        {
                            TempData["messageWARNING"] = "No se generará ninguna notificacion ya que los parametros ingresados son invalidos.";
                            transactionScope.Dispose();

                            if (notificacion.Copia)
                            {
                                return RedirectToAction("NotificacionCopyManager", "Notificacion", new { idNotificacion = auxId, idPaciente = notificacion.IdPaciente });
                            }
                            return View("NotificacionManager", notificacion);
                        }

                        List<Notificacion> notificaciones = this.NotificacionService.BuildNotificaciones(notificacion);

                        if (notificaciones.Any())
                            this.NotificacionService.InsertNotificaciones(notificaciones, notificacion.ListOpciones);
                    }
                    else if (notificacion.IdNotificacion == -1)
                    {
                        try
                        {
                            List<Notificacion> notificaciones = this.NotificacionService.BuildNotificacionesStandar(notificacion);

                            if (notificaciones.Any())
                                this.NotificacionService.InsertNotificaciones(notificaciones, notificacion.ListOpciones);
                        }
                        catch (Exception e)
                        {
                            TempData["messageWARNING"] = "Algo salió mal.";
                            transactionScope.Dispose();

                            return View("NotificacionManager", notificacion);
                        }
                    }
                    else
                    {
                        if (notificacion.IdEstadoNotificacion != null
                            && (notificacion.IdEstadoNotificacion == Convert.ToInt32(EnumEstadoNotificacion.Pendiente)
                                || notificacion.IdEstadoNotificacion == Convert.ToInt32(EnumEstadoNotificacion.Entregada))
                            )
                        {
                            if (!this.NotificacionService.ValidarNotificaciones(notificacion))
                            {
                                TempData["messageWARNING"] = "No se generará ninguna notificacion ya que los parametros ingresados son invalidos.";
                                transactionScope.Dispose();

                                return View("NotificacionManager", notificacion);
                            }

                            this.NotificacionService.UpdateNotificaciones(notificacion);
                        }
                        else
                        {
                            TempData["messageERROR"] = "La notificación seleccionada fué respondida.";
                            transactionScope.Dispose();

                            return View("NotificacionManager", notificacion);
                        }

                    }

                    transactionScope.Complete();

                    return RedirectToAction("NotificacionList", "Notificacion", new { idPaciente = notificacion.IdPaciente });
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;
                    transactionScope.Dispose();

                    return View("NotificacionManager", notificacion);
                }
            }
        }

        public JsonResult GetOpcionesByIdNotificacion(string sidx, string sord, int page, int rows, bool _search, string filters, int idNotificacion)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                var opcionesNotificacion = idNotificacion != -1 ?
                    this.NotificacionOpcionService.GetByIdNotificacion(idNotificacion).ToList()
                    : this.NotificacionOpcionService.GetOpcionesStandar().ToList();

                var totalRecords = opcionesNotificacion.Count;

                JsonResult json = Json(new
                {
                    opciones = (from item in opcionesNotificacion
                                select new
                                {
                                    idNotificacionOpcion = item.IdNotificacionOpcion,
                                    descripcionOpcion = item.Descripcion
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

        [HttpPost]
        public ActionResult DeleteNotificacion(int idNotificacion)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    Notificacion notificacion = this.NotificacionService.GetById(idNotificacion);

                    this.NotificacionService.Delete(idNotificacion);

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

        #region NotificacionCopyList

        public IActionResult NotificacionCopyList(int idPaciente)
        {
            try
            {
                Usuario paciente = this.NotificacionService.GetPacienteById(idPaciente);
                ViewBag.IdPaciente = idPaciente;
                ViewBag.NombrePaciente = paciente.Nombre;

                return View();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return RedirectToAction("PacienteList", "Paciente");
            }
        }

        #region JQGrid

        public JsonResult GetNotificacionesCopy(string sidx, string sord, int page, int rows, bool _search, string filters)
        {
            try
            {
                TempData["messageERROR"] = string.Empty;

                IEnumerable<Notificacion> notificaciones = this.NotificacionService.GetNotificacionesProfesional(UserCache.IdUsuario);

                if (notificaciones != null)
                {
                    var totalRecords = notificaciones.Count();

                    JsonResult json = Json(new
                    {
                        total = (totalRecords + rows - 1) / rows,
                        page,
                        records = totalRecords,
                        rows = (from item in notificaciones
                                select new
                                {
                                    idNotificacion = item.IdNotificacion,
                                    fecha = item.FechaHora,
                                    mensaje = item.Mensaje,
                                    estado = item.IdEstadoNotificacionNavigation.Descripcion

                                }).OrderByDescending(x => x.fecha).ToArray()
                    });

                    return json;
                }
            }
            catch (Exception ex)
            {
                TempData["messageERROR"] = "Se produjo un error en la aplicacion. " + ex.Message;
            }

            return new JsonResult(new { });
        }

        #endregion

        #endregion

        #region NotificacionCopyManager

        [HttpGet]
        public ActionResult NotificacionCopyManager(int idNotificacion, int idPaciente)
        {
            NotificacionWrapper notificacion = this.NotificacionService.GetNotificacionWrapperById(idNotificacion);

            notificacion.IdPaciente = idPaciente;
            notificacion.FechaDesde = DateTime.Now;
            notificacion.Hora = DateTime.Now;
            notificacion.IdEstadoNotificacion = null;
            notificacion.Copia = true;

            return View("NotificacionManager", notificacion);
        }

        #endregion

        #region NotificacionRespuesta

        public IActionResult NotificacionRespuesta(int idNotificacion)
        {
            try
            {
                Notificacion notificacion = this.NotificacionService.GetWithFK(idNotificacion);

                if (notificacion != null)
                {
                    if (notificacion.NotificacionOpcion.Any())
                        return RedirectToAction("NotificacionRespuestaOpciones", "Notificacion", new { idNotificacion });
                    else
                        return RedirectToAction("NotificacionRespuestaMensaje", "Notificacion", new { idNotificacion });
                }

                return RedirectToAction("DashboardPaciente", "Paciente");
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return RedirectToAction("DashboardPaciente", "Paciente");
            }
        }

        #region NotificacionRespuestaOpciones

        public IActionResult NotificacionRespuestaOpciones(int idNotificacion)
        {
            try
            {
                Notificacion notificacion = this.NotificacionService.GetWithFK(idNotificacion);

                return View(notificacion);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return RedirectToAction("DashboardPaciente", "Paciente");
            }
        }

        public IActionResult RespuestaNotificacionOp(int idNotificacion, int idNotificacionOpcion)
        {
            try
            {
                var notificacionRespuesta = new NotificacionRespuesta
                {
                    IdNotificacion = idNotificacion,
                    IdNotificacionOpcion = idNotificacionOpcion
                };

                this.NotificacionRespuestaService.Insert(notificacionRespuesta);

                return RedirectToAction("NotificacionRespuestaMensaje", "Notificacion", new { idNotificacion = idNotificacion });
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return RedirectToAction("DashboardPaciente", "Paciente");
            }
        }

        #endregion


        #region NotificacionRespuestaMensaje

        public IActionResult NotificacionRespuestaMensaje(int idNotificacion)
        {
            try
            {
                return View(new NotificacionRespuesta { IdNotificacion = idNotificacion });
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return RedirectToAction("DashboardPaciente", "Paciente");
            }
        }

        [HttpPost]
        public ActionResult NotificacionRespuestaManager(NotificacionRespuesta notificacionRespuesta)
        {
            using (var transactionScope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                try
                {
                    Notificacion notificacion = this.NotificacionService.GetWithFK(Convert.ToInt32(notificacionRespuesta.IdNotificacion));

                    if (!notificacion.NotificacionRespuesta.Any())
                        this.NotificacionRespuestaService.Insert(notificacionRespuesta);
                    else
                        this.NotificacionRespuestaService.Update(notificacionRespuesta);

                    this.NotificacionService.UpdateStatus(Convert.ToInt32(notificacionRespuesta.IdNotificacion), EnumEstadoNotificacion.Respondida);

                    transactionScope.Complete();

                    return RedirectToAction("DashboardPaciente", "Paciente");
                }
                catch (GeneralValidationException ex)
                {
                    TempData["messageERROR"] = ex.Message;

                    transactionScope.Dispose();

                    return View("NotificacionRespuestaManager", notificacionRespuesta);
                }
                catch (Exception ex)
                {
                    TempData["messageERROR"] = "Se produjo un error en la aplicación. " + ex.Message;

                    transactionScope.Dispose();

                    return View("NotificacionRespuestaManager", notificacionRespuesta);
                }
            }
        }

        #endregion

        #endregion

        #region Notificacion Standard

        [HttpGet]
        public ActionResult NotificacionStandarManager(int idPaciente)
        {
            var notificacion = new NotificacionWrapper()
            {
                IdNotificacion = Convert.ToInt32(EnumNotificacionEstandar.Standar),
                IdPaciente = idPaciente,
                Mensaje = "¿Cómo estás?",
                FechaDesde = DateTime.Now.AddDays(1),
                CantDias = 1
            };

            return View("NotificacionManager", notificacion);
        }

        #endregion
    }
}
