<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FinishingCharacter.aspx.cs" Inherits="TPC_Equipo_10.FinishingCharacter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .margin {
            margin-right: 10px;
        }

        .input {
            width: 60%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex justify-content-md-center align-items-center vh-100">
        <div class="container form-control" style="padding-top: 25px; border-width: medium; border-color: black;">
            <h4 class="title" style="display: flex; justify-content: center">¡ULTIMOS DETALLES!</h4>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Nombre</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtName" CssClass="input" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                </div>
            </div>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Sexo</label>
                <div class="col-sm-10">
                    <asp:RadioButton runat="server" GroupName="gender" ID="RadioButton1" Text="Masculino" OnCheckedChanged="rb_CheckedChanged" />
                    <asp:RadioButton runat="server" GroupName="gender" ID="RadioButton2" Text="Femenino" OnCheckedChanged="rb_CheckedChanged" />
                </div>
            </div>
            <div class="mb-3 row">
                <div class="container" style="display: flex; justify-content: center">
                    <asp:LinkButton runat="server" ID="btnConfirm" CssClass="btn btn-danger margin" Text="Confirmar" OnClick="btnConfirm_Click"></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnCancel" CssClass="btn btn-danger" Text="Cancelar" OnClick="btnCancel_Click"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
