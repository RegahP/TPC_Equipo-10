using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Creature
    {
        public int id { get; set; }
        public string name { get; set; }
        public string desc { get; set; }
        public int rating { get; set; }
        public int prof { get; set; } //proficiency
        public int armor { get; set; }//armor class
        public int maxHealth { get; set; } //maximum health
        public int gold { get; set; } //maximum health
        
        public List<CreatureItem> drops = new List<CreatureItem>(); //drops
        
        public List<int> abilities = new List<int>(); //abilities (6)
        public List<int> attacks = new List<int>(); 

        //constructor sets nonset properties
    }
}
