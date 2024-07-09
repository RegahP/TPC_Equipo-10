using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBAccess;
using DomainModel;

namespace TPC_Equipo_10
{
    public partial class EditProfile : Page
    {
        public int iconID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            //if (!IsPostBack)
            //{
            //    User user = (User)Session["user"];
            //    inputNewUsername.Text = user.username;
            //}
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            try
            {
                User user = (User)Session["user"];


                string newUsername = inputNewUsername.Text;
                string newPassword = inputNewPassword.Text;
                string confirmPassword = inputConfirmPassword.Text;

                if (string.IsNullOrWhiteSpace(newUsername))
                {
                    lblErrorMessage.Text = "Usuario vacío";
                    lblErrorMessage.Visible = true;
                    return;
                }
                else if (string.IsNullOrWhiteSpace(newPassword))
                {
                    lblErrorMessage.Text = "Contraseña vacía";
                    lblErrorMessage.Visible = true;
                    return;
                }
                else if (string.IsNullOrWhiteSpace(confirmPassword))
                {
                    lblErrorMessage.Text = "Confirmar contraseña vacía";
                    lblErrorMessage.Visible = true;
                    return;
                }

                if (newPassword != confirmPassword)
                {
                    lblErrorMessage.Text = "Las contraseñas no coinciden";
                    lblErrorMessage.Visible = true;
                    return;
                }

                if (newUsername.Length < 6 || newUsername.Length > 30)
                {
                    lblErrorMessage.Text = "El nombre de usuario debe tener entre 6 y 30 caracteres.";
                    lblErrorMessage.Visible = true;
                    return;
                }
                else if (newPassword.Length < 6 || newPassword.Length > 30)
                {
                    lblErrorMessage.Text = "La contraseña debe tener entre 6 y 30 caracteres.";
                    lblErrorMessage.Visible = true;
                    return;
                }

                if (newUsername.Contains(" "))
                {
                    lblErrorMessage.Text = "El nombre de usuario no puede contener espacios.";
                    lblErrorMessage.Visible = true;
                    return;
                }
                else if (newPassword.Contains(" "))
                {
                    lblErrorMessage.Text = "La contraseña no puede contener espacios.";
                    lblErrorMessage.Visible = true;
                    return;
                }

                bool letterContain = false;
                bool numberContain = false;

                foreach (char pass in newPassword)
                {
                    if (char.IsLetter(pass))
                    {
                        letterContain = true;
                    }

                    if (char.IsDigit(pass))
                    {
                        numberContain = true;
                    }

                }

                if (!letterContain || !numberContain)
                {
                    lblErrorMessage.Text = "La contraseña debe contener al menos una letra y un número.";
                    lblErrorMessage.Visible = true;
                    return;
                }

                user.username = newUsername;
                user.iconID = iconID;
                user.passwordHash = newPassword;
              

                DataAccess.ModifyUserProfile(user);

                lblErrorMessage.Text = "Perfil actualizado exitosamente!";
                lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                lblErrorMessage.Visible = true;

                Session["user"] = user;
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Ocurrió un error al actualizar el perfil: " + ex.Message;
                lblErrorMessage.Visible = true;
            }
        }

        protected void icon_CheckedChanged(object sender, EventArgs e)
        {
            string rbID = ((RadioButton)sender).ID;
            iconID = int.Parse(rbID[rbID.Length - 1].ToString());
        }
    }
}
