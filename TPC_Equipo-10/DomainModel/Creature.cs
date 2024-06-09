using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Creature
    {
        public int id { get; }
        public string name { get; }
        public string desc { get; }
        public int rating { get; }
        public int xp { get; } //experience
        public int prof { get; set; } //proficiency
        public int armor { get; } //armor class
        public int maxHealth { get; } //maximum health
        public int currHealth { get; set; } //current health
        public List<Item> drops { get; set; } //drops
        public int goldDrop { get; set; }
        public List<Ability> abilities { get; set; } //abilities (6)

        //constructor sets nonset properties
    }
}
