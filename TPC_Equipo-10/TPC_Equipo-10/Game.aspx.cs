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

            character = SetCharacter((int)Session["characterID"]);
           
            //leer desde db y cargar TODO, db base + relevantes al pj
            //razas, clases, trasfondos, abilities, skills, items, creatures, TODO
            //el character relevante a la partida, sus abilities, skills, items
        }

        //funciones WebMethod van a ser llamadas por p5js para LEER y ESCRIBIR a la db
        //recordar que el juego GUARDA en db dinamicamente, y LEE de db al principio
        public Character SetCharacter(int charID)
        {
          
            Character character = new Character();
            List<Character> characterList = new List<Character>();
            characterList = DataAccess.ListCharacters();

            foreach (Character charac in characterList)
            {
                if (charac.id == charID)
                {
                    character = charac;
                    break;
                }
            }

            return character;
        }


        [WebMethod]
        public static Character GetCharacter()
        {
            //esto iria en el constructor de character, y los datos pasados como argumentos para el mismo deben venir desde la db
            character.gameState = 0; //temp
            Debug.WriteLine("Character sent from CodeBehind to AJAX Call succesfully.");
            return character;
        }

        [WebMethod]
        public static void SaveCharacter(Character character)
        {
            Debug.WriteLine("Character recieved from AJAX Call to CodeBehind succesfully.");
            //aca recibimos el character del juego, cuando cambien los datos
        }

        [WebMethod] //devuelve todas abilidades del juego al ajax
        public static List<Ability> GetAbilities()
        {
            Debug.WriteLine("Abilities sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.ListAbilities();
        }

        [WebMethod] //devuelve todos los items del juego al ajax
        public static List<Item> GetItems()
        {
            Debug.WriteLine("All items sent from CodeBehind to AJAX Call succesfully.");
            return DataAccess.GetItems();
        }
    }
}