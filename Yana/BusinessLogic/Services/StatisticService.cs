using BinserDashboard.Models.WrapperEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Yana.DataAccess.Repositories;
using Yana.Enums;
using Yana.Helpers;
using Yana.Models.DomainEntities;
using Yana.Models.Enums;
using Yana.Models.WrapperEntities;

namespace Yana.BusinessLogic.Services
{
    public class StatisticService
    {
        #region Constructor

        public StatisticService()
        {
            this.RegistroDiarioRepository = new RegistroDiarioRepository();
            this.PacientePatologiaRepository = new PacientePatologiaRepository();
            this.ProfesionalInstitucionRepository = new ProfesionalInstitucionRepository();
            this.ProfesionalPacienteRepository = new ProfesionalPacienteRepository();
            this.UsuarioRepository = new UsuarioRepository();
            this.NotificacionRepository = new NotificacionRepository();
        }

        private RegistroDiarioRepository RegistroDiarioRepository { get; set; }
        private PacientePatologiaRepository PacientePatologiaRepository { get; set; }
        private ProfesionalInstitucionRepository ProfesionalInstitucionRepository { get; set; }
        private ProfesionalPacienteRepository ProfesionalPacienteRepository { get; set; }
        private UsuarioRepository UsuarioRepository { get; set; }
        private NotificacionRepository NotificacionRepository { get; set; }

        #endregion

        public List<GraphSerieWrapper> GetCantidadRegistroDiarioByPaciente()
        {
            var series = new List<GraphSerieWrapper>();

            List<RegistroDiario> registrosDiarios = this.RegistroDiarioRepository.GetAllWithFk();

            if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente))
            {
                registrosDiarios = registrosDiarios.Where(x => x.IdPaciente == UserCache.IdUsuario).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Profesional))
            {
                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByProfesional(UserCache.IdUsuario);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                registrosDiarios = registrosDiarios.Where(x => x.IdPaciente != null && idsPacientes.Contains(Convert.ToInt32(x.IdPaciente))).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Institucion))
            {
                List<ProfesionalInstitucion> profesionalesInstitucion = this.ProfesionalInstitucionRepository.GetProfesionalesByInstitucion(UserCache.IdInstitucionUsuario);

                List<int> idsProfesionalesInstitucion = profesionalesInstitucion.Where(y => y.IdProfesional != null).Select(x => (int)x.IdProfesional).ToList();

                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByIdsProfesionales(idsProfesionalesInstitucion);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                registrosDiarios = registrosDiarios.Where(x => x.IdPaciente != null && idsPacientes.Contains(Convert.ToInt32(x.IdPaciente))).ToList();
            }

            var registrosDiariosPorPaciente = registrosDiarios
                                                .Where(x => x.IdPaciente != null)
                                                .GroupBy(x => new { x.IdPaciente, x.IdPacienteNavigation.Apellido, x.IdPacienteNavigation.Nombre })
                                                .Select(group => new
                                                {
                                                    NombrePaciente = string.Format("{0} {1}", group.Key.Nombre, group.Key.Apellido),
                                                    CantidadRegistros = group.Count()
                                                });

            var cantRegistrosDiariosList = new List<double>();
            var pacientesList = new List<string>();

            foreach (var registroDiario in registrosDiariosPorPaciente)
            {
                cantRegistrosDiariosList.Add(registroDiario.CantidadRegistros);

                pacientesList.Add(registroDiario.NombrePaciente);
            }
            
            series.Add(new GraphSerieWrapper { NameSerie = "Cantidad", ListValue = cantRegistrosDiariosList, Color = EnumUtils.GetEnumValueDescription(EnumColor.Verde), ListCategory = pacientesList });

            return series;
        }

        public List<GraphSerieWrapper> GetGetEmocionesUltimaSemana()
        {
            var series = new List<GraphSerieWrapper>();

            List<Usuario> pacientes = this.UsuarioRepository.GetPacientes();

            if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente))
            {
                pacientes = pacientes.Where(x => x.IdUsuario == UserCache.IdUsuario).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Profesional))
            {
                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByProfesional(UserCache.IdUsuario);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                pacientes = pacientes.Where(x => x.IdUsuario != null && idsPacientes.Contains(Convert.ToInt32(x.IdUsuario))).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Institucion))
            {
                List<ProfesionalInstitucion> profesionalesInstitucion = this.ProfesionalInstitucionRepository.GetProfesionalesByInstitucion(UserCache.IdInstitucionUsuario);

                List<int> idsProfesionalesInstitucion = profesionalesInstitucion.Where(y => y.IdProfesional != null).Select(x => (int)x.IdProfesional).ToList();

                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByIdsProfesionales(idsProfesionalesInstitucion);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                pacientes = pacientes.Where(x => x.IdUsuario != null && idsPacientes.Contains(Convert.ToInt32(x.IdUsuario))).ToList();
            }

            List<RegistroDiario> registrosDiarios = this.RegistroDiarioRepository.GetAllWithFk();

            var cantRegistrosTristezaList = new List<double>();
            var pacientesTristezaList = new List<string>();
            var cantRegistrosFelicidadList = new List<double>();
            var pacientesFelicidadList = new List<string>();
            var cantRegistrosMiedoList = new List<double>();
            var pacientesMiedoList = new List<string>();
            var cantRegistrosSorpresaList = new List<double>();
            var pacientesSorpresaList = new List<string>();
            var cantRegistrosAscoList = new List<double>();
            var pacientesAscoList = new List<string>();
            var cantRegistrosIraList = new List<double>();
            var pacientesIraList = new List<string>();
            var cantRegistrosFrustracionList = new List<double>();
            var pacientesFrustracionList = new List<string>();

            foreach (Usuario paciente in pacientes)
            {
                int registrosTristeza = registrosDiarios.Where(x => x.IdPaciente == paciente.IdUsuario && x.IdTipoEmocion == Convert.ToInt32(EnumTipoEmocion.Tristeza)).Count();
                int registrosFelicidad = registrosDiarios.Where(x => x.IdPaciente == paciente.IdUsuario && x.IdTipoEmocion == Convert.ToInt32(EnumTipoEmocion.Felicidad)).Count();
                int registrosMiedo = registrosDiarios.Where(x => x.IdPaciente == paciente.IdUsuario && x.IdTipoEmocion == Convert.ToInt32(EnumTipoEmocion.Miedo)).Count();
                int registrosSorpresa = registrosDiarios.Where(x => x.IdPaciente == paciente.IdUsuario && x.IdTipoEmocion == Convert.ToInt32(EnumTipoEmocion.Sorpresa)).Count();
                int registrosAsco = registrosDiarios.Where(x => x.IdPaciente == paciente.IdUsuario && x.IdTipoEmocion == Convert.ToInt32(EnumTipoEmocion.Asco)).Count();
                int registrosIra = registrosDiarios.Where(x => x.IdPaciente == paciente.IdUsuario && x.IdTipoEmocion == Convert.ToInt32(EnumTipoEmocion.Ira)).Count();
                int registrosFrustracion = registrosDiarios.Where(x => x.IdPaciente == paciente.IdUsuario && x.IdTipoEmocion == Convert.ToInt32(EnumTipoEmocion.Frustracion)).Count();

                cantRegistrosTristezaList.Add(registrosTristeza);
                pacientesTristezaList.Add(string.Format("{0} {1}", paciente.Nombre, paciente.Apellido));

                cantRegistrosFelicidadList.Add(registrosFelicidad);
                pacientesFelicidadList.Add(string.Format("{0} {1}", paciente.Nombre, paciente.Apellido));

                cantRegistrosMiedoList.Add(registrosMiedo);
                pacientesMiedoList.Add(string.Format("{0} {1}", paciente.Nombre, paciente.Apellido));

                cantRegistrosSorpresaList.Add(registrosSorpresa);
                pacientesSorpresaList.Add(string.Format("{0} {1}", paciente.Nombre, paciente.Apellido));

                cantRegistrosAscoList.Add(registrosAsco);
                pacientesAscoList.Add(string.Format("{0} {1}", paciente.Nombre, paciente.Apellido));

                cantRegistrosIraList.Add(registrosIra);
                pacientesIraList.Add(string.Format("{0} {1}", paciente.Nombre, paciente.Apellido));

                cantRegistrosFrustracionList.Add(registrosFrustracion);
                pacientesFrustracionList.Add(string.Format("{0} {1}", paciente.Nombre, paciente.Apellido));
            }

            series.Add(new GraphSerieWrapper { NameSerie = "Tristeza", ListValue = cantRegistrosTristezaList, Color = EnumUtils.GetEnumValueDescription(EnumColor.AzulOscuro), ListCategory = pacientesTristezaList });
            series.Add(new GraphSerieWrapper { NameSerie = "Felicidad", ListValue = cantRegistrosFelicidadList, Color = EnumUtils.GetEnumValueDescription(EnumColor.Amarillo), ListCategory = pacientesFelicidadList });
            series.Add(new GraphSerieWrapper { NameSerie = "Miedo", ListValue = cantRegistrosMiedoList, Color = EnumUtils.GetEnumValueDescription(EnumColor.Violeta), ListCategory = pacientesMiedoList });
            series.Add(new GraphSerieWrapper { NameSerie = "Sorpresa", ListValue = cantRegistrosSorpresaList, Color = EnumUtils.GetEnumValueDescription(EnumColor.Naranja), ListCategory = pacientesSorpresaList });
            series.Add(new GraphSerieWrapper { NameSerie = "Asco", ListValue = cantRegistrosAscoList, Color = EnumUtils.GetEnumValueDescription(EnumColor.Verde), ListCategory = pacientesAscoList });
            series.Add(new GraphSerieWrapper { NameSerie = "Ira", ListValue = cantRegistrosIraList, Color = EnumUtils.GetEnumValueDescription(EnumColor.Rojo), ListCategory = pacientesIraList });
            series.Add(new GraphSerieWrapper { NameSerie = "Frustración", ListValue = cantRegistrosFrustracionList, Color = EnumUtils.GetEnumValueDescription(EnumColor.Gris), ListCategory = pacientesFrustracionList });

            return series;
        }

        public List<GraphSerieWrapper> GetRespuestasNotificaciones()
        {
            var series = new List<GraphSerieWrapper>();

            List<Usuario> pacientes = this.UsuarioRepository.GetPacientes();

            List<Notificacion> notificaciones = this.NotificacionRepository.GetAll();

            if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente))
            {
                pacientes = pacientes.Where(x => x.IdUsuario == UserCache.IdUsuario).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Profesional))
            {
                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByProfesional(UserCache.IdUsuario);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                pacientes = pacientes.Where(x => x.IdUsuario != null && idsPacientes.Contains(Convert.ToInt32(x.IdUsuario))).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Institucion))
            {
                List<ProfesionalInstitucion> profesionalesInstitucion = this.ProfesionalInstitucionRepository.GetProfesionalesByInstitucion(UserCache.IdInstitucionUsuario);

                List<int> idsProfesionalesInstitucion = profesionalesInstitucion.Where(y => y.IdProfesional != null).Select(x => (int)x.IdProfesional).ToList();

                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByIdsProfesionales(idsProfesionalesInstitucion);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                pacientes = pacientes.Where(x => x.IdUsuario != null && idsPacientes.Contains(Convert.ToInt32(x.IdUsuario))).ToList();
            }

            var cantidadNotificacionesEntregadas = new List<double>();
            var pacientesNotificacionesEntregadas = new List<string>();
            var cantidadNotificacionesRespondidas = new List<double>();
            var pacientesNotificacionesRespondidas = new List<string>();
            var cantidadNotificacionesVencidas = new List<double>();
            var pacientesNotificacionesVencidas = new List<string>();

            foreach (Usuario paciente in pacientes)
            {
                int entregadas = notificaciones.Where(x => x.IdPaciente == paciente.IdUsuario 
                                                        && x.IdEstadoNotificacion == Convert.ToInt32(EnumEstadoNotificacion.Entregada))
                                                .Count();
                
                int respondidas = notificaciones.Where(x => x.IdPaciente == paciente.IdUsuario 
                                                        && x.IdEstadoNotificacion == Convert.ToInt32(EnumEstadoNotificacion.Respondida))
                                                .Count();

                int vencidas = notificaciones.Where(x => x.IdPaciente == paciente.IdUsuario 
                                                        && x.IdEstadoNotificacion == Convert.ToInt32(EnumEstadoNotificacion.Vencida))
                                                .Count();

                cantidadNotificacionesEntregadas.Add(entregadas);
                pacientesNotificacionesEntregadas.Add(string.Format("{0} {1}", paciente.Nombre, paciente.Apellido));

                cantidadNotificacionesRespondidas.Add(respondidas);
                pacientesNotificacionesRespondidas.Add(string.Format("{0} {1}", paciente.Nombre, paciente.Apellido));

                cantidadNotificacionesVencidas.Add(vencidas);
                pacientesNotificacionesVencidas.Add(string.Format("{0} {1}", paciente.Nombre, paciente.Apellido));
            }

            series.Add(new GraphSerieWrapper { NameSerie = "Entregadas", ListValue = cantidadNotificacionesEntregadas, Color = EnumUtils.GetEnumValueDescription(EnumColor.Verde), ListCategory = pacientesNotificacionesEntregadas });
            series.Add(new GraphSerieWrapper { NameSerie = "Respondidas", ListValue = cantidadNotificacionesRespondidas, Color = EnumUtils.GetEnumValueDescription(EnumColor.Celeste), ListCategory = pacientesNotificacionesRespondidas });
            series.Add(new GraphSerieWrapper { NameSerie = "Vencidas", ListValue = cantidadNotificacionesVencidas, Color = EnumUtils.GetEnumValueDescription(EnumColor.Celeste), ListCategory = pacientesNotificacionesVencidas });

            return series;
        }

        public List<GraphSerieWrapper> GetPacientesPorPatologia()
        {
            var series = new List<GraphSerieWrapper>();

            List<PacientePatologia> pacientesPatologias = this.PacientePatologiaRepository.GetAllWithFk();

            if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente))
            {
                pacientesPatologias = pacientesPatologias.Where(x => x.IdPaciente == UserCache.IdUsuario).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Profesional))
            {
                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByProfesional(UserCache.IdUsuario);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                pacientesPatologias = pacientesPatologias.Where(x => x.IdPaciente != null && idsPacientes.Contains(Convert.ToInt32(x.IdPaciente))).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Institucion))
            {
                List<ProfesionalInstitucion> profesionalesInstitucion = this.ProfesionalInstitucionRepository.GetProfesionalesByInstitucion(UserCache.IdInstitucionUsuario);

                List<int> idsProfesionalesInstitucion = profesionalesInstitucion.Where(y => y.IdProfesional != null).Select(x => (int)x.IdProfesional).ToList();

                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByIdsProfesionales(idsProfesionalesInstitucion);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                pacientesPatologias = pacientesPatologias.Where(x => x.IdPaciente != null && idsPacientes.Contains(Convert.ToInt32(x.IdPaciente))).ToList();
            }

            var patogologiasPorPaciente = pacientesPatologias
                                                .Where(x => x.IdPaciente != null)
                                                .GroupBy(x => new { x.IdPatologiaNavigation.IdPatologia, x.IdPatologiaNavigation.Nombre })
                                                .Select(group => new
                                                {
                                                    NombrePatologia = string.Format("{0}", group.Key.Nombre),
                                                    CantidadPacientes = group.Count()
                                                });

            var cantPatologiasList = new List<double>();
            var patologiasList = new List<string>();

            foreach (var pacientePatologia in patogologiasPorPaciente)
            {
                cantPatologiasList.Add(pacientePatologia.CantidadPacientes);

                patologiasList.Add(pacientePatologia.NombrePatologia);

                series.Add(new GraphSerieWrapper
                {
                    NameSerie = pacientePatologia.NombrePatologia,
                    Value = pacientePatologia.CantidadPacientes
                });

            }

            return series;
        }        

        public DispersionGraphDataWrapper GetDispersionEdadPaciente()
        {
            List<Usuario> pacientes = this.UsuarioRepository.GetPacientesWithRegistroDiario();

            if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente))
            {
                pacientes = pacientes.Where(x => x.IdUsuario == UserCache.IdUsuario).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Profesional))
            {
                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByProfesional(UserCache.IdUsuario);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                pacientes = pacientes.Where(x => x.IdUsuario != null && idsPacientes.Contains(Convert.ToInt32(x.IdUsuario))).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Institucion))
            {
                List<ProfesionalInstitucion> profesionalesInstitucion = this.ProfesionalInstitucionRepository.GetProfesionalesByInstitucion(UserCache.IdInstitucionUsuario);

                List<int> idsProfesionalesInstitucion = profesionalesInstitucion.Where(y => y.IdProfesional != null).Select(x => (int)x.IdProfesional).ToList();

                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByIdsProfesionales(idsProfesionalesInstitucion);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                pacientes = pacientes.Where(x => x.IdUsuario != null && idsPacientes.Contains(Convert.ToInt32(x.IdUsuario))).ToList();
            }

            var pacientesFemeninoDispersion = new StringBuilder();
            var pacientesMasculinoDispersion = new StringBuilder();

            pacientesFemeninoDispersion.Append("[");
            pacientesMasculinoDispersion.Append("[");

            foreach (Usuario paciente in pacientes)
            {
                int cantidadRegistrosDiarios = paciente.RegistroDiario.Count();
                
                if (paciente.Sexo == "M")
                {
                    if (pacientesFemeninoDispersion.Length > 1)
                        pacientesFemeninoDispersion.Append(", ");

                    pacientesFemeninoDispersion.Append(string.Format("[{0}, {1}]", paciente.Edad, cantidadRegistrosDiarios));
                }
                else
                {
                    if (pacientesMasculinoDispersion.Length > 1)
                        pacientesMasculinoDispersion.Append(", ");

                    pacientesMasculinoDispersion.Append(string.Format("[{0}, {1}]", paciente.Edad, cantidadRegistrosDiarios));
                }
            }

            pacientesFemeninoDispersion.Append("]");
            pacientesMasculinoDispersion.Append("]");
            
            var dispersionDataWrapper = new DispersionGraphDataWrapper 
            { 
                ArrayFemenino = pacientesFemeninoDispersion.ToString(), 
                ArrayMasculino = pacientesMasculinoDispersion.ToString() 
            };

            return dispersionDataWrapper;
        }

        public DispersionGraphDataWrapper GetDispersionNotificaciones()
        {
            List<Usuario> pacientes = this.UsuarioRepository.GetPacientesWithNotificaciones();

            if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Paciente))
            {
                pacientes = pacientes.Where(x => x.IdUsuario == UserCache.IdUsuario).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Profesional))
            {
                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByProfesional(UserCache.IdUsuario);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                pacientes = pacientes.Where(x => x.IdUsuario != null && idsPacientes.Contains(Convert.ToInt32(x.IdUsuario))).ToList();
            }
            else if (UserCache.IdPerfil == Convert.ToInt32(EnumPerfilUsuario.Institucion))
            {
                List<ProfesionalInstitucion> profesionalesInstitucion = this.ProfesionalInstitucionRepository.GetProfesionalesByInstitucion(UserCache.IdInstitucionUsuario);

                List<int> idsProfesionalesInstitucion = profesionalesInstitucion.Where(y => y.IdProfesional != null).Select(x => (int)x.IdProfesional).ToList();

                List<ProfesionalPaciente> pacientesProfesional = this.ProfesionalPacienteRepository.GetPacientesByIdsProfesionales(idsProfesionalesInstitucion);

                List<int> idsPacientes = pacientesProfesional.Where(y => y.IdPaciente != null).Select(x => (int)x.IdPaciente).ToList();

                pacientes = pacientes.Where(x => x.IdUsuario != null && idsPacientes.Contains(Convert.ToInt32(x.IdUsuario))).ToList();
            }

            var pacientesFemeninoDispersion = new StringBuilder();
            var pacientesMasculinoDispersion = new StringBuilder();

            pacientesFemeninoDispersion.Append("[");
            pacientesMasculinoDispersion.Append("[");

            foreach (Usuario paciente in pacientes)
            {
                int cantidadNotificacionesRespondidas = paciente.NotificacionIdPacienteNavigation
                                                                .Where(s => s.IdEstadoNotificacion == Convert.ToInt32(EnumEstadoNotificacion.Respondida))
                                                                    .Count();
                
                if (paciente.Sexo == "M")
                {
                    if (pacientesFemeninoDispersion.Length > 1)
                        pacientesFemeninoDispersion.Append(", ");

                    pacientesFemeninoDispersion.Append(string.Format("[{0}, {1}]", paciente.Edad, cantidadNotificacionesRespondidas));
                }
                else
                {
                    if (pacientesMasculinoDispersion.Length > 1)
                        pacientesMasculinoDispersion.Append(", ");

                    pacientesMasculinoDispersion.Append(string.Format("[{0}, {1}]", paciente.Edad, cantidadNotificacionesRespondidas));
                }
            }

            pacientesFemeninoDispersion.Append("]");
            pacientesMasculinoDispersion.Append("]");
            
            var dispersionDataWrapper = new DispersionGraphDataWrapper 
            { 
                ArrayFemenino = pacientesFemeninoDispersion.ToString(), 
                ArrayMasculino = pacientesMasculinoDispersion.ToString() 
            };

            return dispersionDataWrapper;
        }        
    }
}
