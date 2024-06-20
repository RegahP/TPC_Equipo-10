using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Ability
    {
        public int id { get; set; }
        public string name { get; set; }
        public string desc { get; set; }
        public int score { get; set; }
        public int bonus { get; set; }

        //constructor sets nonset properties
    }
}
