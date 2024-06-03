using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Ability
    {
        public int id { get; }
        public string name { get; }
        public string desc { get; }
        public int score { get; }
        public int bonus { get; set; }

        //constructor sets nonset properties
    }
}
