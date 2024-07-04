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
    public partial class ClassSelection : System.Web.UI.Page
    {
        public List<Class> classList = new List<Class>();

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

                classList = DataAccess.ListClasses();

                rptClass.DataSource = classList;
                rptClass.DataBind();
            }
        }

        protected void confirmClass_btn_Click(object sender, EventArgs e)
        {
            int classId = int.Parse(((LinkButton)sender).CommandArgument);
            foreach (Class clas in classList)
            {
                if (clas.id == classId)
                {
                    if (characterID != -1)
                    {
                        DataAccess.ModifyCharacter(3, characterID, classId, false, "");
                        Response.Redirect("CharacterDetail.aspx?id=" + characterID, false);
                    }
                    else
                    {
                        character.idClass = clas.id;
                        Session.Add("character", character);
                        Response.Redirect("backgroundSelection.aspx", false);
                    }
                }


            }
        }


    }
}