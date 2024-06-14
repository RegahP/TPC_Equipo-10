using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Consumable : Item
    {
        public int effectID { get; } //-1 = heal; >0 = abilityID
        public int amount { get; }
        public bool consumed { get; set; }
		public bool duration { get; } //in rounds
		public bool currRound {get; set; } //current round of effect
        //constructor sets nonset properties
    }
}
