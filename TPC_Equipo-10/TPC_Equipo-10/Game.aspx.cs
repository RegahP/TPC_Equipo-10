using System;
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
    public partial class Game : System.Web.UI.Page
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


            //leer desde db y cargar TODO, db base + relevantes al pj
            //razas, clases, trasfondos, abilities, skills, items, creatures, TODO
            //el character relevante a la partida, sus abilities, skills, items
        }

        //funciones WebMethod van a ser llamadas por p5js para LEER y ESCRIBIR a la db
        //recordar que el juego GUARDA en db dinamicamente, y LEE de db al principio
        [WebMethod] //devuelve el personaje del usuario al ajax
        public static Character GetCharacter()
        {
            character.gameState = 0; //temp
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

        [WebMethod]
        public static void SaveCharacter(Character character)
        {
            Debug.WriteLine("Character recieved from AJAX Call to CodeBehind succesfully.");
            //aca recibimos el character del juego, cuando cambien los datos
        }
    }
}