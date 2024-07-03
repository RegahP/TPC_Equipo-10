using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBAccess;
using DomainModel;

namespace TPC_Equipo_10
{
    public partial class CharacterDetail : System.Web.UI.Page
    {
        public int characterID;
        public Character character;

        public List<Class> listClasses = new List<Class>();
        public List<Race> listRaces = new List<Race>();
        public List<Background> listBackgrounds = new List<Background>();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            else
            {

                characterID = int.Parse(Request.QueryString["id"]);

                listClasses = DataAccess.ListClasses();
                listRaces = DataAccess.ListRaces();
                listBackgrounds = DataAccess.ListBackgrounds();


                List<Character> listCharacters = new List<Character>();
                listCharacters = DataAccess.ListCharacters();

                foreach (Character ch in listCharacters)
                {

                    if (ch.id == characterID)
                    {
                        character = ch;
                        break;
                    }
                }


            }
        }

        protected void editCharacter_btn_Click(object sender, EventArgs e)
        {
            string btnID = ((LinkButton)sender).ID.ToString();


            //Revisar que en el nombre al darle Enter no se rompa
            //Revisar que al cambiar de clase, tambien le aumente la vida maxima y actual.
            //Revisar que con el cambio de raza se le reste el modificador de caracteristica actual y se sume el nuevo.

            if (btnID == "btnName")
            {
                Session.Add("nameOrGender", false);
                Response.Redirect("FinishingCharacter.aspx?characterID=" + character.id, false);
            }
            if (btnID == "btnRace")
            {
                Response.Redirect("CharacterCreator.aspx?characterID=" + character.id, false);
            }
            if (btnID == "btnBackground")
            {
                Response.Redirect("backgroundSelection.aspx?characterID=" + character.id, false);
            }
            if (btnID == "btnClass")
            {
                Response.Redirect("ClassSelection.aspx?characterID=" + character.id, false);
            }
            if (btnID == "btnGender")
            {
                Session.Add("nameOrGender", true);
                Response.Redirect("FinishingCharacter.aspx?characterID=" + character.id, false);
            }
        }
    }
}