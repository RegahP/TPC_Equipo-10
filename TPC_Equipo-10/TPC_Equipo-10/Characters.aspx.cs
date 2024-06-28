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
    public partial class Characters : System.Web.UI.Page
    {
        public List<Character> characterList = new List<Character>();
        public User user;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (User)Session["user"];
            List<Character> filteredCharacters = new List<Character>();


            characterList = DataAccess.ListCharacters();
            foreach(Character character in characterList) //Filtra los personajes por usuario y los carga
            {
                if(character.idUser == user.id)
                {
                    filteredCharacters.Add(character);
                }
            }

            rptCharacters.DataSource = filteredCharacters;
            rptCharacters.DataBind();


        }

        protected void charCreation_Click(object sender, EventArgs e)
        {
            Response.Redirect("CharacterCreator.aspx", false);
        }
    }
}