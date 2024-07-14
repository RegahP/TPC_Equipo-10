<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CharacterRoll.aspx.cs" Inherits="TPC_Equipo_10.CharacterRoll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex justify-content-md-center align-items-center vh-100">
        <div class="container form-control text-center shadow-lg" style="padding-top: 25px; border-width: medium; border-color: black;">

            <h4 class="title" style="display: flex; justify-content: center">¡ROLLEÁ TUS HABILIDADES!</h4>
            <div class="mb-3 row">
                <p>Éstas son tus habilidades. Dictaminan tu poder como personaje, ya sea al momento de disparar una flecha, revolear un mazo o conjurar un hechizo. Hacé click en los dados para ver que puntajes te salen.</p>
            </div>

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
                    <asp:LinkButton runat="server" ID="btnConfirm" CssClass="btn btn-danger disabled" Text="Confirmar" OnClick="btnConfirm_Click"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/roll.js"></script>

</asp:Content>