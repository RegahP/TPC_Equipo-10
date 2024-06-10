using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using DomainModel;

namespace TPC_Equipo_10
{
    public partial class Game : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //leer desde db y cargar TODO, db base + relevantes al pj
            //razas, clases, trasfondos, abilities, skills, items, creatures, TODO
            //el character relevante a la partida, sus abilities, skills, items
        }

        //funciones WebMethod van a ser llamadas por p5js para LEER y ESCRIBIR a la db
        //recordar que el juego GUARDA en db dinamicamente, y LEE de db al principio
        [WebMethod]
        public static Character GetCharacter()
        {
            //esto seria de la db
            Character character = new Character();

            //esto iria en el constructor de character, y los datos 
            //pasados como argumentos para el mismo deben venir desde la db
            character.gameState = 0;
            Debug.Write("Character sent from CodeBehind to AJAX Call succesfully.");
            return character;
        }

        [WebMethod]
        public static void SaveCharacter(Character character)
        {
            //aca recibimos el character del juego, cuando cambien los datos
            Debug.Write("Character recieved from AJAX Call to CodeBehind succesfully.");
        }
    }
}