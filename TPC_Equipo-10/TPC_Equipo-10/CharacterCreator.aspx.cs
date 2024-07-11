using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBAccess;
using DomainModel;
using System.Diagnostics;
using System.Collections;

namespace TPC_Equipo_10
{
    public partial class CharacterCreator : Page
    {
        public List<Race> raceList = new List<Race>();
        public List<Background> BackgroundList = new List<Background>();
        public List<Class> ClassList = new List<Class>();
        public List<Ability> abilityList = new List<Ability>();

        public Character character = new Character();

        public int characterID = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            else
            {
                if (Request.QueryString["characterID"] != null)
                {
                    characterID = int.Parse(Request.QueryString["characterID"]);
                }

                raceList = DataAccess.ListRaces();
                BackgroundList = DataAccess.ListBackgrounds();
                ClassList = DataAccess.ListClasses();
                abilityList = DataAccess.ListAbilities();

                rptRace.DataSource = raceList;
                rptRace.DataBind();
            }
        }

        protected void confirmRace_btn_Click(object sender, EventArgs e)
        {
            int raceId = int.Parse(((LinkButton)sender).CommandArgument);

            character.idRace = raceId;

            if (characterID != -1)
            {
                DataAccess.ModifyCharacter(1, characterID, raceId, false, "");
                Response.Redirect("CharacterDetail.aspx?id=" + characterID, false);
            }
            else
            {
                Session.Add("character", character);
                Response.Redirect("ClassSelection.aspx", false);
            }
        }
    }
}