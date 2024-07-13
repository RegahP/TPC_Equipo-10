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
    public partial class FinishingCharacter : Page
    {
        public Character character = new Character();
        public User user;

        public int characterID = -1;
        public bool nameOrGender;
        public string modName;
        public bool mascOrFem;

        protected void Page_Load(object sender, EventArgs e)
        {
            //si cargo la pagina y ya esta en 6, es porque ya habiamos rolleado
            if (fieldCounter.Value == "6")
            {
                if (fieldCounter != null)
                {
                    string btnConfirmClasses = btnConfirm.CssClass;
                    string newClasses = string.Join(" ", btnConfirmClasses.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries).Where(c => !c.Equals("disabled", StringComparison.OrdinalIgnoreCase)));
                    btnConfirm.CssClass = newClasses;
                }
            }

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
                character.sex = true;
            }
            if (((RadioButton)sender).ID == "rbFeminine")
            {
                character.sex = false;
            }
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            character.name = txtName.Text;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                lblErrorMessage.Text = "Nombre vacío";
                lblErrorMessage.Visible = true;
                return;
            }
            if (txtName.Text.Contains(" "))
            {
                lblErrorMessage.Text = "El nombre de personaje no puede contener espacios.";
                lblErrorMessage.Visible = true;
                txtName.Text = null;
                return;
            }
            AddRolledAbilities();

            DataAccess.NewCharacter(character, user.id);
            Response.Redirect("Characters.aspx", false);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Characters.aspx", false);
        }

        public void AddRolledAbilities()
        {
            RolledAbility str = new RolledAbility(0, int.Parse(fieldSTR.Value), (int.Parse(fieldSTR.Value) - 10) / 2);
            RolledAbility dex = new RolledAbility(1, int.Parse(fieldDEX.Value), (int.Parse(fieldDEX.Value) - 10) / 2);
            RolledAbility con = new RolledAbility(2, int.Parse(fieldCON.Value), (int.Parse(fieldCON.Value) - 10) / 2);
            RolledAbility nte = new RolledAbility(3, int.Parse(fieldINT.Value), (int.Parse(fieldINT.Value) - 10) / 2);
            RolledAbility wis = new RolledAbility(4, int.Parse(fieldWIS.Value), (int.Parse(fieldWIS.Value) - 10) / 2);
            RolledAbility cha = new RolledAbility(5, int.Parse(fieldCHA.Value), (int.Parse(fieldCHA.Value) - 10) / 2);

            character.abilities.Add(str);
            character.abilities.Add(dex);
            character.abilities.Add(con);
            character.abilities.Add(nte);
            character.abilities.Add(wis);
            character.abilities.Add(cha);
        }
    }
}