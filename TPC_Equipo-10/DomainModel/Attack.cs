using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    internal class Attack
    {
        public int id { get; set; }
        public string name { get; set; }
        public string desc { get; set; }
        public int dmgTypeID {  get; set; }
        public int damage {  get; set; }

    }
}
