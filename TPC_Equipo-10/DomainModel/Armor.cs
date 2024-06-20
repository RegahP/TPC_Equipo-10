using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Armor : Equippable
    {
        public bool armorType { get; set; } //0 = armadura; 1 = escudo
        public DamageType resType { get; set; }
        public int armor { get; set; }

        //constructor sets nonset properties
    }
}
