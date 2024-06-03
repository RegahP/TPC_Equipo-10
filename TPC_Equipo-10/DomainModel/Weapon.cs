using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Weapon : Equippable
    {
        public DamageType dmgType { get; }
        public int abilityModID { get; } //source for damage modification
        public int damage { get; } // currwpn.damage + abilities[currwpn.abilityModSrcID].bonus;

        //constructor sets nonset properties
    }
}
