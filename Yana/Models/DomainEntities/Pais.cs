﻿using System;
using System.Collections.Generic;

namespace Yana.Models.DomainEntities
{
    public partial class Pais
    {
        public Pais()
        {
            Provincia = new HashSet<Provincia>();
        }

        public int IdPais { get; set; }
        public string Descripcion { get; set; }
        public bool BajaLogica { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int IdUsuarioModificacion { get; set; }

        public virtual ICollection<Provincia> Provincia { get; set; }
    }
}
