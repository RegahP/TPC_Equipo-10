<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_Equipo_10.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-md-center align-items-center vh-100" style="background-color: antiquewhite">
        <div class="container form-control">
            <div class="mb-3 row">
                <label for="inputUsername" class="col-sm-2 col-form-label">Usuario</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputUsername">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword">
                </div>
            </div>
            <div class="mb-3 row">
                <div class="container" style="display: flex; justify-content: center">
                    <asp:Button ID="btnBack" CssClass="btn btn-danger" Text="Volver" OnClick="btnBack_Click" runat="server" />
                    <asp:Button ID="btnLoginConfirm" CssClass="btn btn-danger" Text="Loguearse" OnClick="btnLoginConfirm_Click" runat="server" />
                    <a href="/Register.aspx">No tenes una cuenta todavía?</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
