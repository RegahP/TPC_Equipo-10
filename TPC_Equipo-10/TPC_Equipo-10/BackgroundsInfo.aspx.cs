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
    public partial class BackgroundsInfo : System.Web.UI.Page
    {
        public List<Background> backgroundList = new List<Background>();
        public List<Skill> skillList = new List<Skill>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }

            backgroundList = DataAccess.ListBackgrounds();
            skillList = DataAccess.ListSkills();

            rptBg.DataSource = backgroundList;
            rptBg.DataBind();

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Docs.aspx", false);
        }
    }
}