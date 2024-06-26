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
    public partial class NewGame : System.Web.UI.Page
    {
        public List<Character> characterList = new List<Character>();

        protected void Page_Load(object sender, EventArgs e)
        {

            characterList = DataAccess.ListCharacters();

            rptCharacters.DataSource = characterList;
            rptCharacters.DataBind();
        }

        protected void btnSelectChar_Click(object sender, EventArgs e)
        {
            int characterID = int.Parse(((LinkButton)sender).CommandArgument);

            Session.Add("characterID", characterID);
            Response.Redirect("Game.aspx", false);
        }
    }
}