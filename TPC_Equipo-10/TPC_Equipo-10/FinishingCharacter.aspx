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

            <%if (characterID == -1)
                {%>
            <h4 class="title" style="display: flex; justify-content: center">¡ULTIMOS DETALLES!</h4>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Nombre</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtName1" CssClass="input" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Sexo</label>
                <div class="col-sm-10">
                    <asp:RadioButton runat="server" GroupName="gender" ID="rbMasculine1" Text="Masculino" OnCheckedChanged="rb_CheckedChanged" />
                    <asp:RadioButton runat="server" GroupName="gender" ID="rbFeminine1" Text="Femenino" OnCheckedChanged="rb_CheckedChanged" />
                </div>
            </div>
            <%}
                else if (characterID != -1 && nameOrGender == false)
                {%>
            <h4 class="title" style="display: flex; justify-content: center">¡ULTIMOS DETALLES!</h4>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Nombre</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtName2" AutoPostBack="false" CssClass="input" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                </div>
            </div>
            <%}
                else if (characterID != -1 && nameOrGender == true)
                {%>
            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">Sexo</label>
                <div class="col-sm-10">
                    <asp:RadioButton runat="server" GroupName="gender" ID="rbMasculine2" Text="Masculino" OnCheckedChanged="rb_CheckedChanged" />
                    <asp:RadioButton runat="server" GroupName="gender" ID="rbFeminine2" Text="Femenino" OnCheckedChanged="rb_CheckedChanged" />
                </div>
            </div>
            <%}
                if (characterID == -1)
                {

            %>
            <div class="d-flex justify-content-md-center align-items-center gap-4">
                <div id="rollSTR"></div>
                <div id="rollDEX"></div>
                <div id="rollCON"></div>
                <div id="rollINT"></div>
                <div id="rollWIS"></div>
                <div id="rollCHA"></div>
            </div>
            <div class="container text-center" style="width: 95%; margin-bottom: 30px">
                <div class="row">
                    <asp:HiddenField runat="server" ID="fieldCounter" />
                    <div class="col">
                        Fuerza
                        <asp:HiddenField runat="server" ID="fieldSTR" />
                    </div>
                    <div class="col">
                        Destreza
                        <asp:HiddenField runat="server" ID="fieldDEX" />
                    </div>
                    <div class="col">
                        Constitución
                        <asp:HiddenField runat="server" ID="fieldCON" />
                    </div>
                    <div class="col">
                        Inteligencia
                        <asp:HiddenField runat="server" ID="fieldINT" />
                    </div>
                    <div class="col">
                        Sabiduría
                        <asp:HiddenField runat="server" ID="fieldWIS" />
                    </div>
                    <div class="col">
                        Carisma
                        <asp:HiddenField runat="server" ID="fieldCHA" />
                    </div>
                </div>
            </div>
            <div class="mb-3 row">
                <div class="container" style="display: flex; justify-content: center">
                    <asp:LinkButton runat="server" ID="btnConfirm1" CssClass="btn btn-danger margin disabled" Text="Confirmar" OnClick="btnConfirm_Click"></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnCancel1" CssClass="btn btn-danger" Text="Cancelar" OnClick="btnCancel_Click"></asp:LinkButton>
                </div>
            </div>
            <%}
                else
                {  %>
            <div class="mb-3 row">
                <div class="container" style="display: flex; justify-content: center">
                    <asp:LinkButton runat="server" ID="btnConfirm" CssClass="btn btn-danger margin" Text="Confirmar" OnClick="btnConfirm_Click"></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnCancel" CssClass="btn btn-danger" Text="Cancelar" OnClick="btnCancel_Click"></asp:LinkButton>
                </div>
            </div>
            <%} %>
        </div>
    </div>
    <script src="Scripts/roll.js"></script>

</asp:Content>
