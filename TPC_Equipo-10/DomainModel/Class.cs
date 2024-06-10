using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Class
    {
        public int id { get; }
        public string name { get; }
        public string desc { get; }
        public int classHealth { get; }
        public string specialName { get; }
        public string specialDesc { get; }
        public int abilityID { get; } //ability relevant to this class

        //constructor sets nonset properties
    }
}
