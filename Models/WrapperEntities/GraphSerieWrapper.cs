

namespace BinserDashboard.Models.WrapperEntities
{
    using System;
    using System.Collections.Generic;

    public class GraphSerieWrapper
    {
        public string NameSerie { get; set; }
        public double Value { get; set; }
        public bool Sliced { get; set; }
        public bool Selected { get; set; }
        public Decimal ExtraValue { get; set; }
        public string Color { get; set; }
        public List<string> ListCategory { get; set; }
        public List<double> ListValue { get; set; }
    }
}