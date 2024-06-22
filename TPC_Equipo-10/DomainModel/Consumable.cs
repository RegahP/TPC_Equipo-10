using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Consumable : Item
    {
        public int effectID { get; set; } //-1 = heal; >0 = abilityID
        public int amount { get; set; }
        //constructor sets nonset properties
    }
}
