using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Race
    {
        public int id { get; }
        public string name { get; }
        public string desc { get; }
        public int abilityID { get; }

        //constructor sets nonset properties
        public Race()
        {
            id = 0;
            name = string.Empty;
            desc = string.Empty;
            abilityID = 0;
        }
    }
}
