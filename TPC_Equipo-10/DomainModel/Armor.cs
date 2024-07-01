using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Armor : Equippable
    {
        public int armorType { get; set; } //0 = armadura; 1 = escudo
        public int resTypeID { get; set; }
        public int armor { get; set; }

        //constructor sets nonset properties
    }
}
