<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="TPC_Equipo_10.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            background-color: beige;
            width: 60%;
            max-width: 500px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

            .form-container h2 {
                text-align: center;
            }

            .form-container .form-group {
                margin-bottom: 15px;
            }

        .icon {
            image-rendering: pixelated;
            width: 100px;
            background-color: antiquewhite;
            outline: 2px solid;
            outline-color: darkkhaki;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-md-center align-items-center vh-100">
        <div class="form-container">
            <h2>Editar Perfil</h2>
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            <div class="form-group">
                <label for="inputNewUsername">Nuevo Username</label>
                <asp:TextBox ID="inputNewUsername" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="inputNewPassword">Nueva Contraseña</label>
                <asp:TextBox ID="inputNewPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="inputConfirmPassword">Confirmar Nueva contraseña</label>
                <asp:TextBox ID="inputConfirmPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            </div>

            <div class="mb-3 row">
                <div class="container text-center">
                    <div class="row">
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb0" Checked="true" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb0.ClientID %>" class="img-radio">
                                    <asp:Image ID="img0" runat="server" ImageUrl="~/Sprites/Icons/0.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb1" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb1.ClientID %>" class="img-radio">
                                    <asp:Image ID="img1" runat="server" ImageUrl="~/Sprites/Icons/1.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb2" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb2.ClientID %>" class="img-radio">
                                    <asp:Image ID="img2" runat="server" ImageUrl="~/Sprites/Icons/2.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb3" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb3.ClientID %>" class="img-radio">
                                    <asp:Image ID="img3" runat="server" ImageUrl="~/Sprites/Icons/3.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb4" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb4.ClientID %>" class="img-radio">
                                    <asp:Image ID="img4" runat="server" ImageUrl="~/Sprites/Icons/4.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb5" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb5.ClientID %>" class="img-radio">
                                    <asp:Image ID="img5" runat="server" ImageUrl="~/Sprites/Icons/5.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb6" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb6.ClientID %>" class="img-radio">
                                    <asp:Image ID="img6" runat="server" ImageUrl="~/Sprites/Icons/6.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb7" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb7.ClientID %>" class="img-radio">
                                    <asp:Image ID="img7" runat="server" ImageUrl="~/Sprites/Icons/7.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb8" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb8.ClientID %>" class="img-radio">
                                    <asp:Image ID="img8" runat="server" ImageUrl="~/Sprites/Icons/8.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb9" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb9.ClientID %>" class="img-radio">
                                    <asp:Image ID="img9" runat="server" ImageUrl="~/Sprites/Icons/9.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <asp:Button ID="btnUpdateProfile" CssClass="btn btn-primary" Text="Actualizar Perfil" OnClick="btnUpdateProfile_Click" runat="server" />
        </div>
    </div>
</asp:Content>

