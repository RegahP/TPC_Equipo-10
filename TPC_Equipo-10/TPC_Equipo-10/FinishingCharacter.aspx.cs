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
    public partial class FinishingCharacter : System.Web.UI.Page
    {
        public Character character = new Character();
        public User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            character = (Character)Session["character"];
            user = (User)Session["user"];
        }

        protected void rb_CheckedChanged(object sender, EventArgs e)
        {
            if(((RadioButton)sender).ID == "rbMasculine")
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
            character.name = txtName.Text; //Falta validar todo
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            DataAccess.NewCharacter(character, user.id);
            Response.Redirect("Characters.aspx", false);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx", false);
        }
    }
}