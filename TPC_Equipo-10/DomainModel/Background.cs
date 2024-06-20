using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Background
    {
        public int id { get; set; }
        public string name { get; set; }
        public string desc { get; set; }
        public int skill1BonusID { get; set; }
        public int skill2BonusID { get; set; }
        public int initialGold { get; set; }

        //constructor sets nonset properties
    }
}
