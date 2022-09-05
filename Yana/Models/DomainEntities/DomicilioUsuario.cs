using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class DomicilioUsuario
    {
        public int IdDomicilioUsuario { get; set; }
        public int? IdUsuario { get; set; }
        public string Calle { get; set; }
        public int? Numero { get; set; }
        public int? Piso { get; set; }
        public string Depto { get; set; }
        public string EntreCalle1 { get; set; }
        public string EntreCalle2 { get; set; }
        public string Telefono1 { get; set; }
        public string Telefono2 { get; set; }
        public string Celular1 { get; set; }
        public string Celular2 { get; set; }
        public string TelefonoEmergencia { get; set; }
        public string Observaciones { get; set; }
        public int? IdTipoDomicilio { get; set; }
        public int? IdLocalidad { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual Localidad IdLocalidadNavigation { get; set; }
        public virtual TipoDomicilio IdTipoDomicilioNavigation { get; set; }
        public virtual Usuario IdUsuarioNavigation { get; set; }
    }
}
