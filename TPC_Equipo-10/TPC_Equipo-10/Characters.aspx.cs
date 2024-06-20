using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC_Equipo_10
{
    public partial class Characters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void charCreation_Click(object sender, EventArgs e)
        {
            Response.Redirect("CharacterCreator.aspx", false);
        }
    }
}