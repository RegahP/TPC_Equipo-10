using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBAccess;
using DomainModel;

namespace TPC_Equipo_10
{
    public partial class CharacterDetail : Page
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

                List<Character> listCharacters;
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
    }
}