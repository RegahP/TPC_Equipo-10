<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TPC_Equipo_10.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .btn-danger {
            margin-right: 5px;
        }

        .title {
            font-family: "Oswald", sans-serif;
            font-optical-sizing: auto;
            font-weight: 500;
            font-style: normal;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-md-center align-items-center vh-100">
        <div class="container form-control" style="background-color: beige; padding-top: 25px; border-width: medium; border-color: black;">
            <div class="mb-3 row">
                <h4 class="title" style="display: flex; justify-content: center">¡UNETE A LA AVENTURA!</h4>
                <label for="inputUsername" class="col-sm-2 col-form-label">Usuario:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputUsername" style="width: 90%">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword" style="width: 90%">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="confirmPassword" class="col-sm-2 col-form-label">Confirmar contraseña:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="confirmPassword" style="width: 90%">
                </div>
            </div>
            <div class="mb-3 row">
                <div class="container" style="display: flex; justify-content: center">
                    <asp:Button ID="btnBack" CssClass="btn btn-danger" Text="Volver" OnClick="btnBack_Click" runat="server" />
                    <asp:Button ID="btnRegisterConfirm" CssClass="btn btn-danger" Text="Registrarse" OnClick="btnRegisterConfirm_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
