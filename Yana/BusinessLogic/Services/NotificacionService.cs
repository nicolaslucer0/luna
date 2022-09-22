using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Yana.BusinessLogic.Services.Interfaces;
using Yana.DataAccess.Repositories;
using Yana.Enums;
using Yana.Helpers;
using Yana.Models.DomainEntities;
using Yana.Models.WrapperEntities;

namespace Yana.BusinessLogic.Services
{
    public class NotificacionService : INotificacionService
    {
        #region Properties

        private readonly NotificacionRepository notificacionRepository;
        private readonly NotificacionOpcionRepository notificacionOpcionRepository;
        private readonly UsuarioRepository usuarioRepository;

        #endregion

        #region Constructor

        public NotificacionService()
        {
            this.notificacionRepository = new NotificacionRepository();
            this.notificacionOpcionRepository = new NotificacionOpcionRepository();
            this.usuarioRepository = new UsuarioRepository();
        }

        #endregion

        #region Interface Methods

        public List<Notificacion> GetAll()
        {
            return this.notificacionRepository.GetAll();
        }

        public Notificacion GetById(int id)
        {
            return this.notificacionRepository.Get(id);
        }

        public int Insert(Notificacion entity)
        {
            return this.notificacionRepository.Insert(entity);
        }

        public void Update(Notificacion entity)
        {
            this.notificacionRepository.Update(entity);
        }        

        public void Delete(int id)
        {
            this.notificacionRepository.Delete(id);
        }

        #endregion

        #region Public Methods

        public IEnumerable<Notificacion> GetNotificacionesProfesionalAndPaciente(int idProfesional, int idPaciente)
        {
            return this.notificacionRepository.GetAllByProfesionalAndPaciente(idProfesional, idPaciente);
        }

        public void InsertNotificaciones(List<Notificacion> notificaciones, List<NotificacionOpcionWrapper> listaOpciones)
        {
            foreach (Notificacion notificacion in notificaciones)
            {
                notificacion.IdProfesional = UserCache.IdUsuario;
                notificacion.IdNotificacion = this.notificacionRepository.Insert(notificacion);

                if (listaOpciones != null && listaOpciones.Any())
                    BuildNotificacionOpcion(notificacion, listaOpciones);
            }
        }

        public List<Notificacion> BuildNotificaciones(NotificacionWrapper notificacionWrapper)
        {
            DateTime fecha = new DateTime(Convert.ToDateTime(notificacionWrapper.Hora).Year
                                        , Convert.ToDateTime(notificacionWrapper.Hora).Month
                                        , Convert.ToDateTime(notificacionWrapper.Hora).Day
                                        , Convert.ToDateTime(notificacionWrapper.Hora).Hour
                                        , Convert.ToDateTime(notificacionWrapper.Hora).Minute
                                        , Convert.ToDateTime(notificacionWrapper.Hora).Second);

            DateTime fechaPrimerNotificacion = fecha.AddHours(notificacionWrapper.CadaXhoras);

            var notificacion = new Notificacion()
            {
                Mensaje = notificacionWrapper.Mensaje,
                IdPaciente = notificacionWrapper.IdPaciente,
                FechaHora = fechaPrimerNotificacion
            };

            var notificaciones = new List<Notificacion>();
            DateTime? fechaHastaTotal;
            string descripcionGrupo;

            if (notificacionWrapper.CantDias > 1)
            {
                DateTime fechaDesde = Convert.ToDateTime(notificacion.FechaHora);
                fechaHastaTotal = Convert.ToDateTime(notificacion.FechaHora).Date.AddDays(notificacionWrapper.CantDias).AddTicks(-1);
                descripcionGrupo = $"Desde:{fechaDesde}Hasta:{fechaHastaTotal}";
            }
            else
            {
                fechaHastaTotal = Convert.ToDateTime(notificacion.FechaHora).Date.AddDays(1).AddTicks(-1);
                descripcionGrupo = $"Desde:{notificacion.FechaHora}Hasta:{fechaHastaTotal}";
            }

            if (notificacionWrapper.CadaXhoras != 0)
                notificacion.IdGrupoNotificacion = this.CrearGrupo(descripcionGrupo);

            notificaciones.Add(notificacion);

            if (notificacionWrapper.CadaXhoras != 0)
                notificaciones.AddRange(this.CalcularNotificacionesPorHora(notificacionWrapper.CadaXhoras, fechaHastaTotal, notificacion));

            return notificaciones;
        }

        public NotificacionWrapper GetNotificacionWrapperById(int idNotificacion)
        {
            var notificacion = this.GetById(idNotificacion);
            int cantDias = 1;
            int cantXHora = 0;

            if (notificacion.IdGrupoNotificacion != null)
            {
                List<Notificacion> grupo = this.GetAllByIdGrupo(notificacion.IdGrupoNotificacion);

                var primera = grupo.FirstOrDefault(x => x.FechaHora == grupo.Min(f => f.FechaHora));
                var ultima = grupo.FirstOrDefault(x => x.FechaHora == grupo.Max(f => f.FechaHora));

                if (ultima != null && primera != null && ultima.FechaHora != null && primera.FechaHora != null)
                {
                    TimeSpan ts = (TimeSpan)(ultima.FechaHora - primera.FechaHora);
                    cantDias = ts.Days + 1;

                    List<Notificacion> grupoReducido = grupo.Take(2).OrderBy(x => x.IdNotificacion).ToList();

                    if (grupoReducido[1].FechaHora != null && grupoReducido[0].FechaHora != null)
                    {
                        TimeSpan tsDias = (TimeSpan)(grupoReducido[1].FechaHora - grupoReducido[0].FechaHora);
                        cantXHora = Math.Abs(tsDias.Hours); 
                    }
                }
            }

            return new NotificacionWrapper()
            {
                IdNotificacion = notificacion.IdNotificacion,
                IdPaciente = notificacion.IdPaciente,
                Mensaje = notificacion.Mensaje,
                FechaDesde = notificacion.FechaHora,
                Hora = notificacion.FechaHora,
                CantDias = cantDias,
                CadaXhoras = cantXHora,
                IdEstadoNotificacion = notificacion.IdEstadoNotificacion,
                IdGrupo = notificacion.IdGrupoNotificacion
            };
        }

        public void UpdateNotificaciones(NotificacionWrapper notificacionWrapper)
        {
            if (notificacionWrapper.IdGrupo == null)
            {
                DateTime fecha = new DateTime(Convert.ToDateTime(notificacionWrapper.FechaDesde).Year
                   , Convert.ToDateTime(notificacionWrapper.FechaDesde).Month
                   , Convert.ToDateTime(notificacionWrapper.FechaDesde).Day
                   , Convert.ToDateTime(notificacionWrapper.Hora).Hour
                   , Convert.ToDateTime(notificacionWrapper.Hora).Minute
                   , Convert.ToDateTime(notificacionWrapper.Hora).Second);

                this.notificacionRepository.Update(new Notificacion()
                {
                    IdNotificacion = notificacionWrapper.IdNotificacion,
                    Mensaje = notificacionWrapper.Mensaje,
                    FechaHora = fecha
                });

                #region Opciones

                foreach (var opcion in this.notificacionOpcionRepository.GetByIdNotificacion(notificacionWrapper.IdNotificacion))
                {
                    this.notificacionOpcionRepository.Delete(opcion.IdNotificacionOpcion);
                }

                if (notificacionWrapper.ListOpciones.Any())
                {
                    foreach (var opcion in notificacionWrapper.ListOpciones)
                    {
                        this.notificacionOpcionRepository.Insert(new NotificacionOpcion()
                        {
                            IdNotificacion = notificacionWrapper.IdNotificacion,
                            Descripcion = opcion.descripcionOpcion,
                            Orden = opcion.idNotificacionOpcion
                        });
                    }
                }

                #endregion
            }
            else
            {
                List<Notificacion> grupoNotificaciones = this.notificacionRepository.GetAllByIdGrupo(Convert.ToInt32(notificacionWrapper.IdGrupo));

                var notPendientes = grupoNotificaciones.Where(x => x.IdEstadoNotificacion == (int)EnumEstadoNotificacion.Pendiente || x.IdEstadoNotificacion == (int)EnumEstadoNotificacion.Entregada).ToList();

                if (notPendientes.Any())
                {
                    foreach (var notificacion in notPendientes)
                    {
                        this.notificacionRepository.Delete(notificacion.IdNotificacion);

                        if (notificacion.NotificacionOpcion.Any())
                        {
                            foreach (var opcion in notificacion.NotificacionOpcion)
                            {
                                this.notificacionOpcionRepository.Delete(opcion.IdNotificacionOpcion);
                            }
                        }
                    }
                }

                List<Notificacion> newNotificaciones = this.BuildNotificaciones(notificacionWrapper);

                this.InsertNotificaciones(newNotificaciones, notificacionWrapper.ListOpciones);
            }
        }

        public Usuario GetPacienteById(int idPaciente)
        {
            return this.usuarioRepository.Get(idPaciente);
        }

        public bool ValidarNotificaciones(NotificacionWrapper notificacion)
        {
            if (notificacion.CantDias == 1 && notificacion.CadaXhoras != 0)
            {
                DateTime fecha = new DateTime(Convert.ToDateTime(notificacion.FechaDesde).Year
                    , Convert.ToDateTime(notificacion.FechaDesde).Month
                    , Convert.ToDateTime(notificacion.FechaDesde).Day
                    , Convert.ToDateTime(notificacion.Hora).Hour
                    , Convert.ToDateTime(notificacion.Hora).Minute
                    , Convert.ToDateTime(notificacion.Hora).Second);

                DateTime fechaPrimerNotificacion = fecha.AddHours(notificacion.CadaXhoras);

                return fechaPrimerNotificacion <= Convert.ToDateTime(notificacion.FechaDesde).Date.AddDays(1).AddTicks(-1);
            }

            return true;
        }

        public List<Notificacion> GetByPacienteYEstados(int idPaciente, List<EnumEstadoNotificacion> estadosNotificaciones)
        {
            return this.notificacionRepository.GetByPacienteYEstados(idPaciente, estadosNotificaciones);
        }

        public IEnumerable<Notificacion> GetNotificacionesProfesional(int idProfesional)
        {
            List<Notificacion> notificaciones = new List<Notificacion>();
            List<Notificacion> allNotificaciones = this.notificacionRepository.GetAllByProfesional(idProfesional).ToList();

            List<int?> listaGrupos = allNotificaciones.Where(x => x.IdGrupoNotificacion != null)
                .Select(x => x.IdGrupoNotificacion).Distinct().ToList();

            foreach (int? grupo in listaGrupos)
            {
                Notificacion noti = allNotificaciones.FirstOrDefault(x => x.IdGrupoNotificacion != null && x.IdGrupoNotificacion == Convert.ToInt32(grupo));

                notificaciones.Add(noti);
            }

            notificaciones.AddRange(allNotificaciones.Where(x => x.IdGrupoNotificacion == null).ToList());

            return notificaciones.OrderBy(x => x.IdNotificacion);
        }

        public List<Notificacion> BuildNotificacionesStandar(NotificacionWrapper notificacionWrapper)
        {
            List<Notificacion> notificaciones = new List<Notificacion>();
            int idGrupo =  this.CrearGrupo("Notificacion Standar");

            for (int i = 0; i < notificacionWrapper.CantDias; i++)
            {
                if (i != 0)
                    notificacionWrapper.FechaDesde = Convert.ToDateTime(notificacionWrapper.FechaDesde).AddDays(i);

                List<DateTime> horarios = this.BuidHorariosStandar(notificacionWrapper);

                foreach (DateTime fechaYhora in horarios)
                {
                     var notificacion = new Notificacion()
                     {
                        Mensaje = notificacionWrapper.Mensaje,
                        IdPaciente = notificacionWrapper.IdPaciente,
                        FechaHora = fechaYhora,
                        IdGrupoNotificacion = idGrupo,
                        EsTipoEstadoEmocional = true
                     };

                     notificaciones.Add(notificacion);
                }
            }

            return notificaciones;
        }

        private List<DateTime> BuidHorariosStandar(NotificacionWrapper notificacionWrapper)
        {
            List<DateTime> horarios = new List<DateTime>();

            DateTime fechaManana = new DateTime(Convert.ToDateTime(notificacionWrapper.FechaDesde).Year
                , Convert.ToDateTime(notificacionWrapper.FechaDesde).Month
                , Convert.ToDateTime(notificacionWrapper.FechaDesde).Day);

            DateTime fechaTarde = new DateTime(Convert.ToDateTime(notificacionWrapper.FechaDesde).Year
                , Convert.ToDateTime(notificacionWrapper.FechaDesde).Month
                , Convert.ToDateTime(notificacionWrapper.FechaDesde).Day);

            DateTime fechaNoche = new DateTime(Convert.ToDateTime(notificacionWrapper.FechaDesde).Year
                , Convert.ToDateTime(notificacionWrapper.FechaDesde).Month
                , Convert.ToDateTime(notificacionWrapper.FechaDesde).Day);

            horarios.Add(fechaManana);
            horarios.Add(fechaTarde);
            horarios.Add(fechaNoche);

            return horarios;

        }

        public Notificacion GetWithFK(int idNotificacion)
        {
            return this.notificacionRepository.GetWithFK(idNotificacion);
        }

        public void UpdateStatus(int idNotificacion, EnumEstadoNotificacion estadoNotificacion)
        {
            this.notificacionRepository.UpdateStatus(idNotificacion, estadoNotificacion);
        }

        public List<Notificacion> GetByEstados(List<EnumEstadoNotificacion> estadosNotificaciones)
        {
            return this.notificacionRepository.GetByEstados(estadosNotificaciones);
        }

        public int GetTotalNotificaciones()
        {
            return this.notificacionRepository.GetTotalNotificaciones();
        }

        #endregion

        #region Private Methods

        private static void BuildNotificacionOpcion(Notificacion notificacion, List<NotificacionOpcionWrapper> listaOpciones)
        {
            var notificacionOpcionRepository = new NotificacionOpcionRepository();

            foreach (NotificacionOpcionWrapper opcion in listaOpciones)
            {
                var notificacionOpcion = new NotificacionOpcion()
                {
                    IdNotificacion = notificacion.IdNotificacion,
                    Descripcion = opcion.descripcionOpcion,
                    Orden = opcion.idNotificacionOpcion
                };

                notificacionOpcionRepository.Insert(notificacionOpcion);
            }
        }

        private List<Notificacion> CalcularNotificacionesPorHora(int repeticionHoras, DateTime? fechaHasta, Notificacion notificacion)
        {
            var notificacionesXHora = new List<Notificacion>();
            DateTime fecha = new DateTime();

            fecha = Convert.ToDateTime(notificacion.FechaHora);

            while (fecha <= fechaHasta)
            {
                fecha = Convert.ToDateTime(fecha).AddHours(repeticionHoras);

                if (fecha <= fechaHasta)
                {
                    Notificacion noti = new Notificacion()
                    {
                        IdPaciente = notificacion.IdPaciente,
                        Mensaje = notificacion.Mensaje,
                        FechaHora = fecha,
                        IdGrupoNotificacion = notificacion.IdGrupoNotificacion
                    };
                    notificacionesXHora.Add(noti);
                }
            }

            return notificacionesXHora;
        }

        private int CrearGrupo(string descripcion)
        {
            GrupoNotificacionService grupoService = new GrupoNotificacionService();

            GrupoNotificacion grupo = new GrupoNotificacion()
            {
                Descripcion = descripcion
            };

            return grupoService.Insert(grupo);
        }

        private List<Notificacion> GetAllByIdGrupo(int? idGrupo)
        {
            return this.notificacionRepository.GetAllByIdGrupo(Convert.ToInt32(idGrupo));
        }

        #endregion

        #region NotImplementedMembers


        #endregion        
    }
}
