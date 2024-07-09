<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CharacterDetail.aspx.cs" Inherits="TPC_Equipo_10.CharacterDetail" %>

<%@ Import Namespace="DomainModel" %>
<%@ Import Namespace="DBAccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .title {
            font-family: "Oswald", sans-serif;
            font-optical-sizing: auto;
            font-weight: 500;
            font-style: normal;
        }

        .classImg {
            width: 40%;
        }

        .characterInfo {
            margin-bottom: 30px;
            border: 3px solid;
            border-color: burlywood;
            padding-bottom: 15px;
            background-color: beige;
        }

        .btnMarginBottom {
            margin-bottom: 10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="characterInfo" style="display: flex">
        <div style="display: flex; justify-content: left">

            <%if (character.idClass == 0)
                {%>
            <img class="classImg" src="https://www.dndbeyond.com/avatars/thumbnails/6/359/420/618/636272697874197438.png" alt="" />
            <% } %>
            <%if (character.idClass == 1)
                {%>
            <img class="classImg" src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/6f055b11-30d4-4a48-85a1-774dc8d792cd/dg308lq-774ebb76-101d-49e2-afa9-6f9e523f7fc4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzZmMDU1YjExLTMwZDQtNGE0OC04NWExLTc3NGRjOGQ3OTJjZFwvZGczMDhscS03NzRlYmI3Ni0xMDFkLTQ5ZTItYWZhOS02ZjllNTIzZjdmYzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.hFpv3hPHv-S99ivnKkB469BJHKMQFaIDIwNDVlh7Wyo" alt="" />
            <% } %>
            <%if (character.idClass == 2)
                {%>
            <img class="classImg" src="https://www.worldanvil.com/uploads/images/5306b35bfec003350e5eaa79e3b5fa2e.png" alt="" />
            <% } %>
            <%if (character.idClass == 3)
                {%>
            <img class="classImg" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2016/04/Fe-PirateRogue.png?fit=635%2C753&ssl=1" alt="" />
            <% } %>

            <div style="justify-content: right">

                <div style="display: flex; justify-content: center">
                    <h1 class="title" style="text-align: center"><%:character.name%></h1>
                    <div style="margin-top: 14px; margin-left: 10px;">
                        <asp:LinkButton runat="server" ID="btnName" CssClass="btn btn-danger btn-sm" Text="Editar" OnClick="editCharacter_btn_Click"></asp:LinkButton>
                    </div>
                </div>

                <div class="row" style="column-gap: 8%; margin-bottom: 15px;">
                    <div class="col-5" style="text-align: center; border-style: solid; border-width: thin; border-radius: 10px; background-color: floralwhite; margin-left: 5%">
                        <%foreach (Race rc in listRaces)
                            {
                                if (rc.id == character.idRace)
                                {%>
                        <h4>Raza: <%:rc.name%> </h4>
                        <p><%:rc.desc%></p>

                        <%}
                            } %>
                        <asp:LinkButton runat="server" ID="btnRace" CssClass="btn btn-danger btn-sm btnMarginBottom" Text="Editar" OnClick="editCharacter_btn_Click"></asp:LinkButton>
                    </div>
                    <div class="col-5" style="text-align: center; border-style: solid; border-width: thin; border-radius: 10px; background-color: floralwhite;">
                        <%foreach (Background backG in listBackgrounds)
                            {
                                if (backG.id == character.idBackground)
                                {%>
                        <h4>Trasfondo: <%:backG.name%> </h4>
                        <p><%:backG.desc%></p>

                        <%}
                            } %>
                        <asp:LinkButton runat="server" ID="btnBackground" CssClass="btn btn-danger btn-sm btnMarginBottom" Text="Editar" OnClick="editCharacter_btn_Click"></asp:LinkButton>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 15px;">
                    <div class="col-11" style="border-style: solid; border-width: thin; border-radius: 10px; background-color: floralwhite; margin-left: 5%">
                        <%foreach (Class cl in listClasses)
                            {
                                if (cl.id == character.idClass)
                                {%>
                        <h4>Clase: <%:cl.name %></h4>
                        <p><%:cl.desc %></p>
                        <h4>Habilidad Especial: <%:cl.specialName%></h4>
                        <p><%:cl.specialDesc%></p>

                        <%foreach (RolledAbility ra in character.abilities)
                            {
                                if (ra.abilityID == 2)
                                {%>
                        <h4>Puntos de vida por nivel: <%:cl.classHealth + ra.GetModifier()%></h4>
                        <p>Vida maxima: <%:character.maxHealth%></p>
                        <p>Vida actual: <%:character.currHealth%></p>
                        <%}
                            }%>
                        <%}
                            } %>
                        <asp:LinkButton runat="server" ID="btnClass" CssClass="btn btn-danger btn-sm btnMarginBottom" Text="Editar" OnClick="editCharacter_btn_Click"></asp:LinkButton>
                    </div>
                </div>
                <div class="row" style="column-gap: 8%; margin-bottom: 15px;">
                    <div class="col-5" style="border-style: solid; border-width: thin; border-radius: 10px; background-color: floralwhite; margin-left: 5%">
                        <h4>Nivel: <%:character.level%></h4>
                        <p>Experiencia actual: <%:character.xp%></p>
                        <p>Experiencia necesaria: <%:character.level*10%></p>
                    </div>
                    <div class="col-5" style="border-style: solid; border-width: thin; border-radius: 10px; background-color: floralwhite;">
                        <div style="display: flex; justify-content: center; margin-top:7%;">
                            <%if (character.sex == true)
                                {%>
                            <h4 style="text-align: center; margin-right:10px;">Sexo: Masculino</h4>
                            <%}
                                else
                                {%>
                            <h4 style="text-align: center; margin-right:10px;">Sexo: Femenino</h4>
                            <%}%>
                            <div>
                                <asp:LinkButton runat="server" ID="btnGender" CssClass="btn btn-danger btn-sm" Text="Editar" OnClick="editCharacter_btn_Click"></asp:LinkButton>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>


