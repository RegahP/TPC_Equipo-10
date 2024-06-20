using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Skill
    {
        public int id { get; set; }
        public int abilityID { get; set; }
        public string name { get; set; }
        public string desc { get; set; }
        public int score { get; set; }
      

        //constructor sets nonset properties
    }
}
