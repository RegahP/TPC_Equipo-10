using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace DomainModel
{
    public class Character
    {
        public int id { get; } //id (db)
        public bool sex { get; } //sex
        public Race race { get; } //race
        public Class chrClass { get; } //class
        public Background bg { get; } //background

        public int level { get; set; } //level
        public int xp { get; set; } //experience
        public int prof { get; set; } //proficiency
        public int luck { get; set; } //luck streak from consecutive encounters
        public int round { get; set; } //current round of combat
        public int encounters { get; set; } //amount of encounters since playing
        public int gameState { get; set; } //last gamestate recorded; 0=intro 1=combat 2=endcombat 3=town 4=store 5=rest
        public bool playing { get; set; } //is currently alive and playing

        public int armor { get; set; } //armor class
        public int maxHealth { get; set; } //maximum health
        public int currHealth { get; set; } //current health

        public int gold { get; set; } //gold

        public List<Item> inventory { get; set; } //consumables, generic
        public List<Item> equipment { get; set; } //equippables armor, weapons

        public List<Ability> abilities { get; set; } //abilities (6)
        public List<Skill> skills { get; set; } //skills (8)
    }
}
