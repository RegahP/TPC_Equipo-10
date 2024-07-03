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
        public List<Character> filteredCharacters = new List<Character>();
        public User user;

        public List<Class> listClasses = new List<Class>();
        public List<Race> listRaces = new List<Race>();
        public List<Background> listBackgrounds = new List<Background>();

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
                listBackgrounds = DataAccess.ListBackgrounds();

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

        protected void rptCharacters_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                var currentCharacter = (Character)e.Item.DataItem;


                // va y busca el repeater anidado
                Repeater rptClasses = e.Item.FindControl("rptClasses") as Repeater;

                // filtra la lista de clases basado en el race id
                var filteredClasses = listClasses.Where(clas => clas.id == currentCharacter.idClass);

                // bindea el repeater de clases al de afuera
                rptClasses.DataSource = filteredClasses;
                rptClasses.DataBind();



                // va y busca el repeater anidado
                Repeater rptRaces = e.Item.FindControl("rptRaces") as Repeater;

                // filtra la lista de razas basado en el race id

                var filteredRaces = listRaces.Where(race => race.id == currentCharacter.idRace);

                // bindea el repeater de razas al de afuera
                rptRaces.DataSource = filteredRaces;
                rptRaces.DataBind();



                // va y busca el repeater anidado
                Repeater rptBackgrounds = e.Item.FindControl("rptBackgrounds") as Repeater;

                // filtra la lista de trasfondos basado en el race id

                var filteredBackgrounds = listBackgrounds.Where(bg => bg.id == currentCharacter.idBackground);

                // bindea el repeater de trasfondos al de afuera
                rptBackgrounds.DataSource = filteredBackgrounds;
                rptBackgrounds.DataBind();



            }
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
    }
}