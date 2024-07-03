using DBAccess;
using DomainModel;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_10
{
    public partial class FinishingCharacter : System.Web.UI.Page
    {
        public Character character = new Character();
        public User user;

        public int characterID = -1;
        public bool nameOrGender;
        public string modName;
        public bool mascOrFem;

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
                    nameOrGender = (bool)Session["nameOrGender"];
                }
                else
                {
                    character = (Character)Session["character"];
                    user = (User)Session["user"];
                }
            }

        }

        protected void rb_CheckedChanged(object sender, EventArgs e)
        {
            if (((RadioButton)sender).ID == "rbMasculine")
            {
                if (characterID != -1)
                {
                    mascOrFem = true;
                }
                else
                {
                    character.sex = true;
                }
            }
            if (((RadioButton)sender).ID == "rbFeminine")
            {
                if (characterID != -1)
                {
                    mascOrFem = false;
                }
                else
                {
                    character.sex = false;
                }
            }
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {

            //falta validar nombre
            if (characterID != -1)
            {
                modName = txtName.Text;
            }
            else
            {
                character.name = txtName.Text;
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {

            if (characterID != -1)
            {
                if (nameOrGender == false)
                {
                    DataAccess.modifyCharacter(0, characterID, 0, false, modName);  //funciona siempre y cuando no le den Enter al elegir el nombre
                    Response.Redirect("CharacterDetail.aspx?id=" + characterID, false);
                }
                else
                {
                    DataAccess.modifyCharacter(4, characterID, 0, mascOrFem, "");
                    Response.Redirect("CharacterDetail.aspx?id=" + characterID, false);
                }
            }
            else
            {
                AddRolledAbilities();

                DataAccess.NewCharacter(character, user.id);
                Response.Redirect("Characters.aspx", false);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx", false);
        }

        public void AddRolledAbilities ()
        {
            RolledAbility str = new RolledAbility(0, int.Parse(fieldSTR.Value));
            RolledAbility dex = new RolledAbility(1, int.Parse(fieldDEX.Value));
            RolledAbility con = new RolledAbility(2, int.Parse(fieldCON.Value));
            RolledAbility nte = new RolledAbility(3, int.Parse(fieldINT.Value));
            RolledAbility wis = new RolledAbility(4, int.Parse(fieldWIS.Value));
            RolledAbility cha = new RolledAbility(5, int.Parse(fieldCHA.Value));

            character.abilities.Add(str);
            character.abilities.Add(dex);
            character.abilities.Add(con);
            character.abilities.Add(nte);
            character.abilities.Add(wis);
            character.abilities.Add(cha);
        }
    }
}