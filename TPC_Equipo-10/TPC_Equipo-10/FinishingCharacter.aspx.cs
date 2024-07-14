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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            else
            {
                character = (Character)Session["character"];
                user = (User)Session["user"];
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

            DataAccess.NewCharacter(character, user.id);
            Response.Redirect("Characters.aspx", false);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Characters.aspx", false);
        }

        protected void rbCore_CheckedChanged(object sender, EventArgs e)
        {
            string rbCoreID = ((RadioButton)sender).ID;

            if (rbCoreID == "rbCore0")
            {
                character.hardCore = false;
            }
            else if (rbCoreID == "rbCore1")
            {
                character.hardCore = true;
            }
        }

        protected void rbSex_CheckedChanged(object sender, EventArgs e)
        {
            string rbSexID = ((RadioButton)sender).ID;

            if (rbSexID == "rbSex0")
            {
                character.sex = false;
            }
            else if (rbSexID == "rbSex1")
            {
                character.sex = true;
            }
        }
    }
}