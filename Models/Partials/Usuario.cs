using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Yana.Models.WrapperEntities;

namespace Yana.Models.DomainEntities
{
    public partial class Usuario
    {
        [NotMapped]
        public string SerializedPatologias { get; set; }

        [NotMapped]
        public List<PatologiaPacienteWrapper> ListPatologia
        {
            get
            {
                if (SerializedPatologias != null)
                    return JsonConvert.DeserializeObject<List<PatologiaPacienteWrapper>>(SerializedPatologias);
                
                return null;
            }
        }

        [NotMapped]
        public int IdInstitucion { get; set; }

        [NotMapped]
        public int NotSeenNotifications { get; set; }

        [NotMapped]
        public int Edad 
        {
            get
            {
                var today = DateTime.Today;

                var age = today.Year - Convert.ToDateTime(FechaNacimiento).Year;

                if (Convert.ToDateTime(FechaNacimiento).Date > today.AddYears(-age)) age--;

                return age;
            }
        }
    }
}
