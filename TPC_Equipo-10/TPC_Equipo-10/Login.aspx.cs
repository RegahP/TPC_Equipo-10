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
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void btnLoginConfirm_Click(object sender, EventArgs e)
        {
            User user;
            try
            {
                string userName = inputUsername.Text;
                string passwordHash = inputPassword.Text;

                if (string.IsNullOrEmpty(userName))
                {
                    lblErrorMessage.Text = "Usuario vacío";
                    lblErrorMessage.Visible = true;
                    return;
                }
                else if (string.IsNullOrEmpty(passwordHash))
                {
                    lblErrorMessage.Text = "Contraseña vacía";
                    lblErrorMessage.Visible = true;
                    return;
                }

                int iconID = DataAccess.GetUserIconID(userName);

                user = new User(userName, passwordHash, iconID);


                if (DataAccess.Login(user))
                {
                    Session.Add("user", user);
                    Response.Redirect("MainMenu.aspx", false);
                }
                else
                {
                    lblErrorMessage.Text = "Usuario o contraseña incorrectos";
                    lblErrorMessage.Visible = true;
                }

            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Ocurrio un error " + ex.Message;
                lblErrorMessage.Visible = true;
            }
        }
    }
}