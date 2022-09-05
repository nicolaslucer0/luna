using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Yana.Models.WrapperEntities
{
    public class NotificacionWrapper
    {
        public int IdNotificacion { get; set; }
        public int? IdPaciente { get; set; }
        public string Mensaje { get; set; }
        public DateTime? FechaDesde { get; set; }
        public DateTime? Hora { get; set; }
        public int CantDias { get; set; }
        public int CadaXhoras { get; set; }
        public int? IdEstadoNotificacion { get; set; }
        public int? IdGrupo { get; set; }
        public string SerializedOpciones { get; set; }
        public bool Copia { get; set; }
        public List<NotificacionOpcionWrapper> ListOpciones
        {
            get
            {
                if (SerializedOpciones != null)
                    return JsonConvert.DeserializeObject<List<NotificacionOpcionWrapper>>(SerializedOpciones);
                
                return null;
            }
        }

        public DateTime? Maniana { get; set; }
        public DateTime? Tarde { get; set; }
        public DateTime? Noche { get; set; }
    }
}
