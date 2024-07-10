<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="TPC_Equipo_10.EditProfile" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

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

        .rbtList {
            padding: 0px;
        }

        .rbtItem {
            margin:6px;
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
                <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEditIcon" aria-expanded="false" aria-controls="collapseEditIcon" onclick="toggleEditIcon()">
                    Editar Imagen de Perfil
                </button>
                <asp:HiddenField ID="tglState" runat="server" Value="0" />
                <div class="collapse" id="collapseEditIcon">
                    <div class="card card-body">
                        <div class="container text-center">
                            <div class="row">
                                <asp:RadioButtonList ID="rblIcons" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="rbtList" ValidateRequestMode="Disabled">
                                    <asp:ListItem ID="rb0" Selected="True" Text='<img src="Sprites/Icons/0.png" class="icon rbtItem" />' />
                                    <asp:ListItem ID="rb1" Text='<img src="Sprites/Icons/1.png" class="icon rbtItem" />' />
                                    <asp:ListItem ID="rb2" Text='<img src="Sprites/Icons/2.png" class="icon rbtItem" />' />
                                    <asp:ListItem ID="rb3" Text='<img src="Sprites/Icons/3.png" class="icon rbtItem" />' />
                                    <asp:ListItem ID="rb4" Text='<img src="Sprites/Icons/4.png" class="icon rbtItem" />' />
                                    <asp:ListItem ID="rb5" Text='<img src="Sprites/Icons/5.png" class="icon rbtItem" />' />
                                    <asp:ListItem ID="rb6" Text='<img src="Sprites/Icons/6.png" class="icon rbtItem" />' />
                                    <asp:ListItem ID="rb7" Text='<img src="Sprites/Icons/7.png" class="icon rbtItem" />' />
                                    <asp:ListItem ID="rb8" Text='<img src="Sprites/Icons/8.png" class="icon rbtItem" />' />
                                    <asp:ListItem ID="rb9" Text='<img src="Sprites/Icons/9.png" class="icon rbtItem" />' />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <asp:Button ID="btnUpdateProfile" CssClass="btn btn-primary" Text="Actualizar Perfil" OnClick="btnUpdateProfile_Click" runat="server" CausesValidation="false" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function toggleEditIcon() {
            let hiddenField = document.getElementById('<%= tglState.ClientID %>');
            hiddenField.value = (hiddenField.value === "0") ? "1" : "0";
        }
    </script>
</asp:Content>

