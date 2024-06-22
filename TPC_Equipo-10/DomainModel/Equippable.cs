using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Equippable : Item
    {
        public bool equippableType { get; set; } //0 = weapon, 1 = armor
    }
}
