using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Default.aspx", false);
            }
            if (!IsPostBack)
            {
                Session["update"] = Server.UrlEncode(DateTime.Now.ToString());
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {
                try
                {
                    User user = (User)Session["user"];


                    string newUsername = inputNewUsername.Text;
                    string newPassword = inputNewPassword.Text;
                    string confirmPassword = inputConfirmPassword.Text;

                    if (!string.IsNullOrWhiteSpace(newUsername))
                    {
                        if (newUsername.Length < 6 || newUsername.Length > 30)
                        {
                            lblErrorMessage.ForeColor = Color.Red;
                            lblErrorMessage.Text = "El nombre de usuario debe tener entre 6 y 30 caracteres.";
                            lblErrorMessage.Visible = true;
                            return;
                        }
                        if (newUsername.Contains(" "))
                        {
                            lblErrorMessage.ForeColor = Color.Red;
                            lblErrorMessage.Text = "El nombre de usuario no puede contener espacios.";
                            lblErrorMessage.Visible = true;
                            return;
                        }
                        if (string.IsNullOrWhiteSpace(newPassword))
                        {
                            lblErrorMessage.ForeColor = Color.Red;
                            lblErrorMessage.Text = "Contraseña vacía";
                            lblErrorMessage.Visible = true;
                            return;
                        }

                        if (!string.IsNullOrWhiteSpace(newPassword))
                        {
                            if (newPassword.Length < 6 || newPassword.Length > 30)
                            {
                                lblErrorMessage.ForeColor = Color.Red;
                                lblErrorMessage.Text = "La contraseña debe tener entre 6 y 30 caracteres.";
                                lblErrorMessage.Visible = true;
                                return;
                            }
                            if (newPassword.Contains(" "))
                            {
                                lblErrorMessage.ForeColor = Color.Red;
                                lblErrorMessage.Text = "La contraseña no puede contener espacios.";
                                lblErrorMessage.Visible = true;
                                return;
                            }
                            if (string.IsNullOrWhiteSpace(confirmPassword))
                            {
                                lblErrorMessage.ForeColor = Color.Red;
                                lblErrorMessage.Text = "Confirmar contraseña vacía";
                                lblErrorMessage.Visible = true;
                                return;
                            }
                            if (newPassword != confirmPassword)
                            {
                                lblErrorMessage.ForeColor = Color.Red;
                                lblErrorMessage.Text = "Las contraseñas no coinciden";
                                lblErrorMessage.Visible = true;
                                return;
                            }
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
                            lblErrorMessage.ForeColor = Color.Red;
                            lblErrorMessage.Text = "La contraseña debe contener al menos una letra y un número.";
                            lblErrorMessage.Visible = true;
                            return;
                        }
                    }
                    else if (!string.IsNullOrWhiteSpace(newPassword))
                    {
                        lblErrorMessage.ForeColor = Color.Red;
                        lblErrorMessage.Text = "Usuario vacío";
                        lblErrorMessage.Visible = true;
                        return;
                    }
                    else if (!string.IsNullOrWhiteSpace(confirmPassword))
                    {
                        lblErrorMessage.ForeColor = Color.Red;
                        lblErrorMessage.Text = "Confirmar contraseña vacía";
                        lblErrorMessage.Visible = true;
                        return;
                    }

                    
                    if (tglState.Value == 1.ToString())
                    {
                        user.iconID = rblIcons.SelectedIndex;
                    }

                    if (!string.IsNullOrWhiteSpace(newUsername) && !string.IsNullOrWhiteSpace(newPassword))
                    {
                        user.username = newUsername;
                        user.passwordHash = newPassword;
                        
                        lblErrorMessage.ForeColor = Color.Green;
                        lblErrorMessage.Text = "Perfil actualizado exitosamente!";
                        lblErrorMessage.Visible = true;
                    }

                    DataAccess.ModifyUserProfile(user);
                    Master.RecieveUser(user);

                    Session["user"] = user;

                    rblIcons.SelectedIndex = 0;
                    tglState.Value = 0.ToString();
                }
                catch (Exception ex)
                {
                    lblErrorMessage.ForeColor = Color.Red;
                    lblErrorMessage.Text = "Ocurrió un error al actualizar el perfil: " + ex.Message;
                    lblErrorMessage.Visible = true;
                }
                Session["update"] = Server.UrlEncode(DateTime.Now.ToString());
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            ViewState["update"] = Session["update"];
        }

        protected void tglEditIcon_Click(object sender, EventArgs e)
        {
            if(tglState.Value == 0.ToString())
            {
                tglState.Value = "1";
            }
            else
            {
                tglState.Value = "0";
            }
        }
    }
}
