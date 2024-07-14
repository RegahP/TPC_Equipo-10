using DBAccess;
using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_10
{
    public partial class RacesInfo : System.Web.UI.Page
    {
        public List<Race> raceList = new List<Race>();
        public List<Ability> abilityList = new List<Ability>();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }

            abilityList = DataAccess.ListAbilities();
            raceList = DataAccess.ListRaces();

            rptRaces.DataSource = raceList;
            rptRaces.DataBind();

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Docs.aspx", false);
        }
    }


}