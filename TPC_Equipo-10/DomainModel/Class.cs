using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Class
    {
        public int id { get; set; }
        public string name { get; set; }
        public string desc { get; set; }
        public int classHealth { get; set; }
        public string specialName { get; set; }
        public string specialDesc { get; set; }
        public int abilityID { get; set; } //ability relevant to this class

    }
}
