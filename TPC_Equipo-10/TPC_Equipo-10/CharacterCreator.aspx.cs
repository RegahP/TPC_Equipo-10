using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBAccess;
using DomainModel;
using System.Security.Cryptography.X509Certificates;
using System.Diagnostics;
using System.Collections;

namespace TPC_Equipo_10
{
    public partial class CharacterCreator : System.Web.UI.Page
    {
        public List<Race> raceList = new List<Race>();
        public List<Background> BackgroundList = new List<Background>();
        public List<Class> ClassList = new List<Class>();
        public List<Ability> abilityList = new List<Ability>();

        public Character character = new Character();

        protected void Page_Load(object sender, EventArgs e)
        {
            raceList = DataAccess.ListRaces();
            BackgroundList = DataAccess.ListBackgrounds();
            ClassList = DataAccess.ListClasses();
            abilityList = DataAccess.ListAbilities();


            rptRace.DataSource = raceList;
            rptRace.DataBind();

        }

        protected void confirmRace_btn_Click(object sender, EventArgs e)
        {
            int raceId = int.Parse(((LinkButton)sender).CommandArgument);
            foreach (Race race in raceList)
            {
                if (race.id == raceId)
                {
                    character.race = race.id;
                    
                    //foreach(Ability ability in abilityList)
                    //{
                    //    if(ability.id == character.race.abilityID)
                    //    {
                    //        character.abilities[ability.id].score = 2;
                    //        break;
                    //    }
                    //}

                    Session.Add("character", character);
                    Response.Redirect("ClassSelection.aspx", false);
                }
            }
        }

        protected void rptRace_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // va y busca el repeater anidado
                Repeater rptAbilities = e.Item.FindControl("rptAbilities") as Repeater;

                // filtra la lista de Abilidades basado en el race id
                var currentRace = (Race)e.Item.DataItem;
                var filteredAbility = abilityList.Where(ability => ability.id == currentRace.abilityID).ToList(); // Lo dejo como List porque tenemos un error en la DB (sabiduria en 2 razas)

                // bindea el repeater de Abilidades al de afuera
                rptAbilities.DataSource = filteredAbility;
                rptAbilities.DataBind();
            }
        }
    }
}