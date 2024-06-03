using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Background
    {
        public int id { get; }
        public string name { get; }
        public string desc { get; }
        public int skill1BonusID { get; }
        public int skill2BonusID { get; }
        public int initialGold { get; }

        //constructor sets nonset properties
    }
}
