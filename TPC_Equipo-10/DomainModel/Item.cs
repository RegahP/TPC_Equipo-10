﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Item
    {
        public int id { get; set; }
        public string name { get; set; }
        public string desc { get; set; }
        public int type { get; set; }
        public int price { get; set; }
    }
}
