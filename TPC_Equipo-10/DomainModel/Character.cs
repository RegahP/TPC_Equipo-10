﻿using System;
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
        public int id { get; set; } //id (db)
        public int idUser { get; set; } //id del usuario (db)
        public bool sex { get; set; } //sex  ¿0 es mujer 1 es hombre?
        public Race race { get; set; } //race
        public Class chrClass { get; set; } //class
        public Background bg { get; set; } //background



        public string name { get; set; } //name
        public int level { get; set; } //level
        public int xp { get; set; } //experience
        public int prof { get; set; } //proficiency

        

        public int luck { get; set; } //luck streak from consecutive encounters
        public int round { get; set; } //current round of combat
        public int encounters { get; set; } //amount of encounters since playing
        public int gameState { get; set; } //last gamestate recorded
        //0=intro 1=combat 2=endcombat 3=town 4=store 5=rest 6=dead



        public int armor { get; set; } //armor class
        public int maxHealth { get; set; } //maximum health
        public int currHealth { get; set; } //current health
        public int gold { get; set; } //gold



        public List<Item> inventory { get; set; } //consumables, generic
        public List<Item> equipment { get; set; } //equippables armor, weapons
        public List<Ability> abilities { get; set; } //abilities (6)
        public List<Skill> skills { get; set; } //skills (8)


        public Character()
        {
            race = new Race();
            chrClass = new Class();
            abilities = new List<Ability>();
            skills = new List<Skill>();

        }


    }
}
