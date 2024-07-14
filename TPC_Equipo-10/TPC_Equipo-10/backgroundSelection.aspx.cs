using DBAccess;
using DomainModel;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_10
{
    public partial class backgroundSelection : Page
    {


        public List<Background> backgroundList = new List<Background>();
        public List<Skill> skillList = new List<Skill>();

        public Character character = new Character();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            else
            {
                character = (Character)Session["character"];

                backgroundList = DataAccess.ListBackgrounds();
                skillList = DataAccess.ListSkills();

                rptBackgrounds.DataSource = backgroundList;
                rptBackgrounds.DataBind();
            }

        }

        protected void confirmBackground_btn_Click(object sender, EventArgs e)
        {
            int idBackground = int.Parse(((LinkButton)sender).CommandArgument);

            character.idBackground = idBackground;
            character.gold = backgroundList[idBackground].initialGold;
            Session.Add("character", character);
            Response.Redirect("CharacterRoll.aspx", false);
        }
    }
}