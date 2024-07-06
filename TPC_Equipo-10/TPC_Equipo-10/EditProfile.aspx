<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="TPC_Equipo_10.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        <asp:Button ID="btnUpdateProfile" CssClass="btn btn-primary" Text="Actualizar Perfil" OnClick="btnUpdateProfile_Click" runat="server" />
    </div>
</asp:Content>
