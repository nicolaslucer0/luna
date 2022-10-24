using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class RegistroNewsletter
    {
        public int IdRegistroNewsletter { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Mensaje { get; set; }
        public DateTime FechaAlta { get; set; }
    }
}
