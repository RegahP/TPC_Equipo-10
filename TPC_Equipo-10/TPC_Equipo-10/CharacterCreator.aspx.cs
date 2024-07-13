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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            else
            {
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

            Session.Add("character", character);
            Response.Redirect("ClassSelection.aspx", false);
        }
    }
}