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


        public List<Background> backgroundList = new List<Background>();
        public List<Skill> skillList = new List<Skill>();

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
                else
                {
                    character = (Character)Session["character"];
                }

                backgroundList = DataAccess.ListBackgrounds();
                skillList = DataAccess.ListSkills();

                rptBackgrounds.DataSource = backgroundList;
                rptBackgrounds.DataBind();
            }

        }

        protected void confirmBackground_btn_Click(object sender, EventArgs e)
        {
            int backgroundId = int.Parse(((LinkButton)sender).CommandArgument);
            foreach (Background background in backgroundList)
            {
                if (background.id == backgroundId)
                {

                    if (characterID != -1)
                    {
                        DataAccess.ModifyCharacter(2, characterID, backgroundId, false, "");
                        Response.Redirect("CharacterDetail.aspx?id=" + characterID, false);
                    }
                    else
                    {
                        character.idBackground = background.id;
                        character.gold = background.initialGold;
                        Session.Add("character", character);
                        Response.Redirect("FinishingCharacter.aspx", false);
                    }


                }
            }


        }
    }
}