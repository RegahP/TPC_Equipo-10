using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Effect
    {
        public int itemID { get; set; } // -1 defender, -2 special
        public int currRound { get; set; }
    }
}
