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
            padding-bottom: 15px;
        }

        .btnMarginBottom {
            margin-bottom: 10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="characterInfo" style="display: flex">
        <div class="col" style="margin: 4%">
            <canvas class="chr-canvas icon" data-class="<%= character.idClass %>" data-race="<%= character.idRace %>" data-sex="<%= Convert.ToInt32(character.sex) %>" data-format="1" width="320" height="756"></canvas>
        </div>
        <div style="justify-content: right">
            <div style="display: flex; justify-content: center">
                <h1 class="title" style="text-align: center"><%:character.name%></h1>
                <div style="margin-top: 14px; margin-left: 10px;">
                </div>
            </div>
            <div class="row" style="column-gap: 8%; margin-bottom: 15px;">
                <div class="col-5" style="text-align: center; border-style: solid; border-width: thin; border-radius: 10px; background-color: floralwhite">
                    <%foreach (Race rc in listRaces)
                        {
                            if (rc.id == character.idRace)
                            {%>
                    <h4>Raza: <%:rc.name%> </h4>
                    <p><%:rc.desc%></p>

                    <%}
                        } %>
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
                </div>
            </div>
            <div class="row" style="margin-bottom: 15px;">
                <div class="col-11" style="border-style: solid; border-width: thin; border-radius: 10px; background-color: floralwhite">
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
                    <h4>Puntos de vida por nivel: <%:cl.classHealth + ra.modifier%></h4>
                    <p>Vida maxima: <%:character.maxHealth%></p>
                    <p>Vida actual: <%:character.currHealth%></p>
                    <%}
                        }%>
                    <%}
                        } %>
                </div>
            </div>
            <div class="row" style="column-gap: 8%; margin-bottom: 15px;">
                <div class="col-5" style="border-style: solid; border-width: thin; border-radius: 10px; background-color: floralwhite">
                    <h4>Nivel: <%:character.level%></h4>
                    <p>Experiencia actual: <%:character.xp%></p>
                    <p>Experiencia necesaria: <%:character.level*10%></p>
                </div>
                <div class="col-5" style="border-style: solid; border-width: thin; border-radius: 10px; background-color: floralwhite;">
                    <div style="display: flex; justify-content: center; margin-top: 7%;">
                        <%if (character.sex == true)
                            {%>
                        <h4 style="text-align: center; margin-right: 10px;">Sexo: Masculino</h4>
                        <%}
                            else
                            {%>
                        <h4 style="text-align: center; margin-right: 10px;">Sexo: Femenino</h4>
                        <%}%>
                        <div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script src="Scripts/webform.js"></script>
</asp:Content>
