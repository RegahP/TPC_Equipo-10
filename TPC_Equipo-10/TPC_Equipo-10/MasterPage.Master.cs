using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBAccess;
using DomainModel;

namespace TPC_Equipo_10
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((User)Session["user"] != null){
                int iconID = ((User)Session["user"]).iconID;
                string userName = ((User)Session["user"]).username;
                lblUserName.Text = userName;
                UserIcon.ImageUrl = "~/Sprites/Icons/" + iconID + ".png";
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Default.aspx", false);
        }
    }
}