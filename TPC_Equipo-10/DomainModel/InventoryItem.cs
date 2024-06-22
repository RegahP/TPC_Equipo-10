﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class InventoryItem
    {
        //este objeto es relevante para construir el inventario del jugador
        //relaciona un item original, con un item en uso, y su estado actual
        public int itemID {  get; set; }
        public bool equipped {  get; set; }
        public bool consumed { get; set; }
        public int currRound { get; set; } //current round of effect
    }
}
