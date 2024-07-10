<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Play.aspx.cs" Inherits="TPC_Equipo_10.Play" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .icon {
            image-rendering: pixelated;
            background-color: antiquewhite;
            outline: 2px solid;
            outline-color: darkkhaki;
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

    <%if (filteredCharacters.Count() == 0)
        {
    %>
    <div class="d-flex justify-content-md-center align-items-center vh-100">
        <div class="container form-control" style="padding-top: 25px; border-width: medium; border-color: black; width:40%">
            <div class="mb-3 row">
                <h1 class="title" style="display: flex; justify-content: center">Aun no tienes personajes!</h1>
            </div>
            <div class="mb-3 row text-center">
                <h3 class="title" style="margin-bottom: 25px;">¡Dale click al boton para comenzar tu aventura!</h3>
            </div>
            <div class="mb-3 row-3 text-center">
                <asp:Button ID="btnFirstCharacter" runat="server" CssClass="btn btn-danger" Text="Crear Personaje" OnClick="btnFirstCharacter_Click" />
            </div>
        </div>
    </div>
    <%}
        else
        {%>

    <div>
        <div class="container" style="display: flex; justify-content: center; margin-bottom: 50px; width: 30%;">
            <form class="d-flex" style="width: 100%">
                <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                <button class="btn btn-success" type="submit">Buscar</button>
            </form>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4" style="justify-content: center">
            <asp:Repeater runat="server" ID="rptCharacters" OnItemDataBound="rptCharacters_ItemDataBound">
                <ItemTemplate>

                    <div class="card" style="width: 22%; margin-left: 25px; margin-right: 25px;">
                        <canvas class="chr-canvas icon" data-class="<%# Eval("idClass") %>" data-race="<%# Eval("idRace") %>" data-sex="<%# Convert.ToInt32(Eval("sex")) %>" width="128" height="128" style="margin-top: 12px"></canvas>
                        <div class="card-body">

                            <h5 style="text-align: center"><%# Eval("name") %></h5>

                            <asp:Repeater runat="server" ID="rptClasses">
                                <ItemTemplate>

                                    <p>Clase: <%#Eval("name") %></p>

                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Repeater runat="server" ID="rptRaces">
                                <ItemTemplate>

                                    <p>Raza: <%#Eval("name") %></p>

                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Repeater runat="server" ID="rptBackgrounds">
                                <ItemTemplate>

                                    <p>Trasfondo: <%#Eval("name") %></p>

                                </ItemTemplate>
                            </asp:Repeater>

                            <p>Vida: <%#Eval("currHealth") %></p>

                        </div>
                        <div style="justify-content: center">
                            <asp:LinkButton runat="server" ID="btnSelectChar" CommandArgument='<%# Eval("id")%>' CssClass="btn btn-danger btnStyle" Text="Elegir Personaje" OnClick="btnSelectChar_Click"></asp:LinkButton>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
    <%} %>
    <script src="Scripts/webform.js"></script>
</asp:Content>



