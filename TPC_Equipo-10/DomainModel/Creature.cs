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
        public int xp { get; set; } //experience
        public int prof { get; set; } //proficiency
        public int armor { get; set; }//armor class
        public int maxHealth { get; set; } //maximum health
        public int currHealth { get; set; } //current health
        public List<Item> drops { get; set; } //drops
        public int goldDrop { get; set; }
        public List<Ability> abilities { get; set; } //abilities (6)

        //constructor sets nonset properties
    }
}
