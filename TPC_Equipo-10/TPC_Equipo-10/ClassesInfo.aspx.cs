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
    public partial class ClassesInfo : System.Web.UI.Page
    {
        public List<Class> listClasses = new List<Class>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            else
            {
                listClasses = DataAccess.ListClasses();

                rptClasses.DataSource = listClasses;
                rptClasses.DataBind();
            }


        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Docs.aspx", false);
        }
    }
}