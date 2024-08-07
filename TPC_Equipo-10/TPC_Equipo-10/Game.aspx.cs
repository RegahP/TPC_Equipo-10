﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBAccess;
using DomainModel;

namespace TPC_Equipo_10
{
    public partial class Game : Page
    {

        static Character character = new Character();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            else
            {
                character = DataAccess.GetCharacter((int)Session["characterID"]);
            }
        }

        //funciones WebMethod van a ser llamadas por p5js para LEER y ESCRIBIR a la db
        //recordar que el juego GUARDA en db dinamicamente, y LEE de db al principio

        [WebMethod] //devuelve el personaje del usuario al ajax
        public static Character GetCharacter()
        {
            Debug.WriteLine("Character sent from CodeBehind to AJAX Call succesfully.");
            return character;
        }

        [WebMethod] //devuelve todas las razas del juego al ajax
        public static List<Race> GetRaces()
        {
            Debug.WriteLine("Races sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.ListRaces();
        }

        [WebMethod] //devuelve todas las clases del juego al ajax
        public static List<Class> GetClasses()
        {
            Debug.WriteLine("Classes sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.ListClasses();
        }

        [WebMethod] //devuelve todas las abilities del juego al ajax
        public static List<Ability> GetAbilities()
        {
            Debug.WriteLine("Abilities sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.ListAbilities();
        }

        [WebMethod] //devuelve todas las abilities del juego al ajax
        public static List<Background> GetBackgrounds()
        {
            Debug.WriteLine("Backgrounds sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.ListBackgrounds();
        }
        

        [WebMethod] //devuelve todas las skills del juego al ajax
        public static List<Skill> GetSkills()
        {
            Debug.WriteLine("Skills sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.ListSkills();
        }

        [WebMethod] //devuelve los damagetypes del juego al ajax
        public static List<DamageType> GetDamageTypes()
        {
            Debug.WriteLine("DamageTypes sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.ListDamageTypes();
        }

        [WebMethod] //devuelve todas las creatures del juego al ajax
        public static List<Creature> GetCreatures()
        {
            Debug.WriteLine("Creatures sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.ListCreatures();
        }

        [WebMethod] //devuelve todos los attacks del juego al ajax
        public static List<Attack> GetAttacks()
        {
            Debug.WriteLine("Attacks sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.ListAttacks();
        }

        [WebMethod] //devuelve todos los items del juego al ajax
        public static List<Item> GetItems()
        {
            Debug.WriteLine("All items sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.GetItems();
        }

        [WebMethod] //devuelve el encounter en el que estaba el chr
        public static Encounter GetEncounter(int characterID)
        {
            Debug.WriteLine("Character Encounter sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.GetEncounter(characterID);
        }

        [WebMethod] //devuelve encounter template al ajax
        public static Encounter GetEncounterTemplate()
        {
            Encounter encounter = new Encounter();
            Debug.WriteLine("Encounter Template sent from CodeBehind to AJAX Call succesfully.");
            return encounter;
        }

        [WebMethod] //devuelve effect template al ajax
        public static Effect GetEffectTemplate()
        {
            Effect effect = new Effect();
            Debug.WriteLine("Effect Template sent from CodeBehind to AJAX Call succesfully.");
            return effect;
        }

        [WebMethod] //devuelve el town en el que estaba el chr
        public static Town GetTown(int characterID)
        {
            Debug.WriteLine("Character Town sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.GetTown(characterID);
        }

        [WebMethod] //devuelve town template al ajax
        public static Town GetTownTemplate()
        {
            Town town = new Town();
            Debug.WriteLine("Town Template sent from CodeBehind to AJAX Call succesfully.");
            return town;
        }

        [WebMethod]
        public static void SaveCharacter(Character character)
        {
            Debug.WriteLine("Character recieved from AJAX Call to CodeBehind succesfully.");
            DataAccess.ModifyCharacter(character);
        }

        [WebMethod]
        public static void SaveCharacterAbilities(Character character)
        {
            Debug.WriteLine("Character Abilities recieved from AJAX Call to CodeBehind succesfully.");
            DataAccess.ModifyCharacterAbilities(character);
        }

        [WebMethod]
        public static void SaveEncounter(Encounter encounter, int type)
        {
            Debug.WriteLine("Encounter recieved from AJAX Call to CodeBehind succesfully.");
            if (type == 0) //crea en db
            {
                DataAccess.NewEncounter(encounter);
            }
            else if (type == 1) //modifica en db
            {
                DataAccess.ModifyEncounter(encounter);
            }
            else //elimina en db
            {
                DataAccess.DeleteEncounter(encounter);
            }
        }

        [WebMethod]
        public static void SaveTown(Town town, int type)
        {
            Debug.WriteLine("Town recieved from AJAX Call to CodeBehind succesfully.");
            if (type == 0) //crea en db
            {
                DataAccess.NewTown(town);
            }
            else if (type == 1) //modifica en db
            {
                DataAccess.ModifyTown(town);
            }
            else //elimina en db
            {
                DataAccess.DeleteTown(town);
            }
        }
    }
}