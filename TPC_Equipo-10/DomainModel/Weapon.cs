using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Weapon : Equippable
    {
        public DamageType dmgType { get; set; }
        public int abilityModID { get; set; } //source for damage modification
        public int damage { get; set; } // currwpn.damage + abilities[currwpn.abilityModSrcID].bonus;

        //constructor sets nonset properties
    }
}
