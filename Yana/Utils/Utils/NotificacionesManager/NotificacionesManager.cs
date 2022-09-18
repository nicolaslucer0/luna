using System;
using System.Collections.Generic;
using Yana.BusinessLogic.Services;
using Yana.BusinessLogic.Services.Utils;
using Yana.Enums;
using Yana.Models.DomainEntities;
using Yana.Models.Enums;

namespace Yana.Utils.Utils.NotificacionesManager
{
    public static class NotificacionesManager
    {
        #region Public Methods

        public static void SendNotifications()
        {
            var notificacionService = new NotificacionService();

            List<Notificacion> notificacionsPendientes = notificacionService.GetByEstados(new List<EnumEstadoNotificacion> { EnumEstadoNotificacion.Pendiente, EnumEstadoNotificacion.Entregada } );

            foreach (var notificacion in notificacionsPendientes)
            {
                try
                {
                    if (notificacion.IdEstadoNotificacion == Convert.ToInt32(EnumEstadoNotificacion.Pendiente))
                    {
                        if (EsNotificacionParaActivar(notificacion))
                        {
                            if (notificacion.IdPacienteNavigation != null)
                            {
                                //EmailService.SendMailNotificacionUsuario(notificacion.IdPacienteNavigation);

                                notificacionService.UpdateStatus(notificacion.IdNotificacion, EnumEstadoNotificacion.Entregada);
                            }
                        }
                    }
                    else
                    {
                        if (EsNotificacionVencida(notificacion))
                            notificacionService.UpdateStatus(notificacion.IdNotificacion, EnumEstadoNotificacion.Vencida);
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    throw;
                }
            }
        }

        #endregion

        #region Helper Methods

        private static bool EsNotificacionVencida(Notificacion notificacion)
        {
            double minutosParaVencimiento = (Convert.ToDateTime(notificacion.FechaHora) - Convert.ToDateTime(DateTime.Now)).TotalMinutes;

            if (minutosParaVencimiento > 0)
                return false;

            return Math.Abs(minutosParaVencimiento) >= (int)EnumLimiteVencimientoNotificacion.PorVencer;
        }

        private static bool EsNotificacionParaActivar(Notificacion notificacion)
        {
            double minutosParaVencimiento = (Convert.ToDateTime(notificacion.FechaHora) - Convert.ToDateTime(DateTime.Now)).TotalMinutes;

            return minutosParaVencimiento <= 0;
        }

        #endregion
    }
}
