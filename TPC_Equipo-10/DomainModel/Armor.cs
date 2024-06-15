using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Armor : Equippable
    {
        public bool armorType { get; } //0 = armadura; 1 = escudo
        public DamageType resType { get; }
        public int armor { get; }

        //constructor sets nonset properties
    }
}
