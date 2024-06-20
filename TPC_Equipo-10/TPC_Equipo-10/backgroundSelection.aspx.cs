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
    public partial class backgroundSelection : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();

        public List<Background> backgroundList = new List<Background>();
        public List<Skill> skillList = new List<Skill>();

        public Character character = new Character();

        protected void Page_Load(object sender, EventArgs e)
        {
            character = (Character)Session["character"];

            backgroundList = dataAccess.ListBackgrounds();
            skillList = dataAccess.ListSkills();

            rptBackgrounds.DataSource = backgroundList;
            rptBackgrounds.DataBind();

        }

        protected void confirmBackground_btn_Click(object sender, EventArgs e)
        {
            int backgroundId = int.Parse(((LinkButton)sender).CommandArgument);
            foreach (Background background in backgroundList)
            {
                if (background.id == backgroundId)
                {
                    character.bg = background;
                    character.gold = background.initialGold;

                    //foreach (Skill skill in skillList)
                    //{
                    //    if (skill.id == background.skill1BonusID) // Cuando tengamos la tirada de dado armada pasa a ser un += 2
                    //    {
                    //        skill.score = 2;
                    //    }
                    //    if (skill.id == background.skill2BonusID)
                    //    {
                    //        skill.score = 2;
                    //    }

                    //}

                    Session.Add("character", character);
                    Response.Redirect("FinishingCharacter.aspx", false);
                }
            }
        }
    }
}