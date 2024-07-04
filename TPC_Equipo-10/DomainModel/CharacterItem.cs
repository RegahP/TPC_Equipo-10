using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class CharacterItem
    {
        //este objeto es relevante para construir el inventario de un personaje
        //relaciona un item original, con un item en uso, y su estado actual
        public int itemID {  get; set; }
        public bool equipped {  get; set; }
        public int currRound { get; set; } //state of consumable
        // -1 unconsumed 0 consumed 1 second round 2 second round
    }
}
