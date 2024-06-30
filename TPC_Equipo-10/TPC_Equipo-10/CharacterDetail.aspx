<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CharacterDetail.aspx.cs" Inherits="TPC_Equipo_10.CharacterDetail" %>

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
            height: 750px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="characterInfo" style="display: flex">
        <div style="display: flex; justify-content: left">

            <%if (character.chrClass == 0)
                {%>
            <img class="classImg" src="https://www.dndbeyond.com/avatars/thumbnails/6/359/420/618/636272697874197438.png" alt="" />
            <% } %>
            <%if (character.chrClass == 1)
                {%>
            <img class="classImg" src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/6f055b11-30d4-4a48-85a1-774dc8d792cd/dg308lq-774ebb76-101d-49e2-afa9-6f9e523f7fc4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzZmMDU1YjExLTMwZDQtNGE0OC04NWExLTc3NGRjOGQ3OTJjZFwvZGczMDhscS03NzRlYmI3Ni0xMDFkLTQ5ZTItYWZhOS02ZjllNTIzZjdmYzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.hFpv3hPHv-S99ivnKkB469BJHKMQFaIDIwNDVlh7Wyo" alt="" />
            <% } %>
            <%if (character.chrClass == 2)
                {%>
            <img class="classImg" src="https://www.worldanvil.com/uploads/images/5306b35bfec003350e5eaa79e3b5fa2e.png" alt="" />
            <% } %>
            <%if (character.chrClass == 3)
                {%>
            <img class="classImg" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2016/04/Fe-PirateRogue.png?fit=635%2C753&ssl=1" alt="" />
            <% } %>

            <div style="justify-content: right">
                <h1 class="title" style="text-align: center"><%:character.name%></h1>

                <%foreach(DomainModel.Race rc in listRaces)
                  {
                    if(rc.id == character.race)
                    {%>
                        <h4> Raza: <%:rc.name%> </h4>
                        <p><%:rc.desc%></p>
                    <%}
                  } %>

                <%foreach(DomainModel.Background backG in listBackgrounds)
                  {
                    if(backG.id == character.bg)
                    {%>
                        <h4> Trasfondo: <%:backG.name%> </h4>
                        <p><%:backG.desc%></p>
                  <%}
                  } %>

                <%foreach (DomainModel.Class cl in listClasses)
                  {
                    if (cl.id == character.chrClass)
                    {%>
                        <h4>Clase: <%:cl.name %></h4>
                        <p><%:cl.desc %></p>
                        <h4>Habilidad Especial: <%:cl.specialName%></h4>
                        <p><%:cl.specialDesc%></p>
                      <%foreach (DomainModel.RolledAbility ra in listRA)
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

                <h4>Nivel: <%:character.level%></h4>

                <%if(character.sex == true)
                  {%>
                    <h4>Sexo: Masculino</h4>
                <%}
                  else
                  {%>
                    <h4>Sexo: Femenino</h4>
                <%}%>

            </div>
        </div>
    </div>


</asp:Content>


