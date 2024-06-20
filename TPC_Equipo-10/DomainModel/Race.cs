using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Race
    {
        public int id { get; set; }
        public string name { get; set; }
        public string desc { get; set; }
        public int abilityID { get; set; }

        //constructor sets nonset properties

        //public Race()
        //{
        //    id = 0;
        //    name = string.Empty;
        //    desc = string.Empty;
        //    abilityID = 0;
        //}
    }
}
