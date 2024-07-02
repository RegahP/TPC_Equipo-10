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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void btnRegisterConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                string userName = inputUsername.Text;
                string passwordHash = inputPassword.Text;
                string confirmPass = confirmPassword.Text;

                if(string.IsNullOrWhiteSpace(userName))
                {
                    lblErrorMessage.Text = "Usuario vacío";
                    lblErrorMessage.Visible = true;
                    return;
                }else if(string.IsNullOrWhiteSpace(passwordHash))
                {
                    lblErrorMessage.Text = "Contraseña vacía";
                    lblErrorMessage.Visible = true;
                    return;
                }
                else if(string.IsNullOrWhiteSpace(confirmPass))
                {
                    lblErrorMessage.Text = "Confirmar contraseña vacía";
                    lblErrorMessage.Visible = true;
                    return;
                }

                if(passwordHash != confirmPass)
                {
                    lblErrorMessage.Text = "Las contraseñas no coinciden";
                    lblErrorMessage.Visible = true;
                    return;
                }
                
                if (userName.Length < 6 || userName.Length > 30)
                {
                    lblErrorMessage.Text = "El nombre de usuario debe tener entre 6 y 30 caracteres.";
                    lblErrorMessage.Visible = true;
                    return;
                }
                else if (passwordHash.Length < 6 || passwordHash.Length > 30) 
                {
                    lblErrorMessage.Text = "La contraseña debe tener entre 6 y 30 caracteres.";
                    lblErrorMessage.Visible = true;
                    return;
                } // No le agrego el confirmar contraseña porque es virtualmente imposible que tenga que dar ese msj

                if (userName.Contains(" "))
                {
                    lblErrorMessage.Text = "El nombre de usuario no puede contener espacios.";
                    lblErrorMessage.Visible = true;
                    return;
                }
                else if (passwordHash.Contains(" "))
                {
                    lblErrorMessage.Text = "La contraseña no puede contener espacios.";
                    lblErrorMessage.Visible = true;
                    return;
                }

                bool letterContain = false;
                bool numberContain = false;

                foreach (char pass in passwordHash)
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
                    // Mostrar mensaje de error
                    lblErrorMessage.Text = "La contraseña debe contener al menos una letra y un número.";
                    lblErrorMessage.Visible = true;
                    return;
                }

                User user = new User(userName, passwordHash);
                int id = DataAccess.Register(user);

                if (id >= 0) 
                {
                    user.id = id;
                    Session.Add("user", user);
                    Response.Redirect("MainMenu.aspx", false);
                }
                else
                {
                    lblErrorMessage.Text = "Error al registrar el usuario.";
                    lblErrorMessage.Visible = true;
                }

            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Ocurrio un error " + ex.Message; //Estuve pensando que la unica forma de que esto salte es con un username repetido, asi que podemos poner ese msj a no ser que se les ocurra algo mas que no me di cuenta.
                lblErrorMessage.Visible = true;
            }
        }
    }
}