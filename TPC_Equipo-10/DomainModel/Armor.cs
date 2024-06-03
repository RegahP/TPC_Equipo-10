using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Armor : Equippable
    {
        public DamageType resType { get; }
        public int armor { get; }

        //constructor sets nonset properties
    }
}
