using DBAccess;
using DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace TPC_Equipo_10
{
    public partial class Characters : Page
    {
        public List<Character> characterList = new List<Character>();
        public List<Character> filteredCharacters = new List<Character>();
        public User user;

        public List<Class> listClasses = new List<Class>();
        public List<Race> listRaces = new List<Race>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            else
            {
                user = (User)Session["user"];

                listClasses = DataAccess.ListClasses();
                listRaces = DataAccess.ListRaces();

                characterList = DataAccess.ListCharacters();
                foreach (Character character in characterList) //Filtra los personajes por usuario y los carga
                {
                    if (character.idUser == user.id)
                    {
                        filteredCharacters.Add(character);
                    }
                }

                rptCharacters.DataSource = filteredCharacters;
                rptCharacters.DataBind();
            }
        }

        protected void charCreation_Click(object sender, EventArgs e)
        {
            Response.Redirect("CharacterCreator.aspx", false);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((LinkButton)sender).CommandArgument);

            DataAccess.DeleteCharacter(id);

            Response.Redirect("Characters.aspx", false);
        }

        protected void btnDetail_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((LinkButton)sender).CommandArgument);

            Response.Redirect("CharacterDetail.aspx?id=" + id, false);
        }

        protected void rptCharacters_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var character = (Character)e.Item.DataItem;
                var healthBar = (HtmlGenericControl)e.Item.FindControl("healthBar");

                healthBar.Attributes["style"] = "width: " + (((float)character.currHealth) / character.maxHealth) * 100 + "%";
            }
        }
    }
}