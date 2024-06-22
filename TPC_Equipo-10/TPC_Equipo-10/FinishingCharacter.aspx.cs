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

        protected void Page_Load(object sender, EventArgs e)
        {
            character = (Character)Session["character"];
        }

        protected void rb_CheckedChanged(object sender, EventArgs e)
        {
            if(((RadioButton)sender).Text == "Hombre")
            {
                character.sex = true;
            }
            if (((RadioButton)sender).Text == "Mujer")
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
            DataAccess.NewCharacter(character);
            Response.Redirect("Characters.aspx", false);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}