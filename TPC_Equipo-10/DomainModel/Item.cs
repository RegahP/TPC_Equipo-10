using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Item
    {
        public int id { get; }
        public string name { get; }
        public string desc { get; }
        public int type { get; }
        public int price { get; }

        //constructor sets nonset properties
    }
}
