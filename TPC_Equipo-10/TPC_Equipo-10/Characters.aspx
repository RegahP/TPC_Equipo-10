<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Characters.aspx.cs" Inherits="TPC_Equipo_10.Characters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .size {
            width: 40%;
        }

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

        #noCharacter {
            margin-top: 17%;
            text-align: center;
            align-content: center;
            width: fit-content;
            background-color: floralwhite;
            padding: 25px;
            border-radius: 20px;
            border-style: solid;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>


        <%if (filteredCharacters.Count() == 0)
            {
        %>

        <div class="container" id="noCharacter">
            <h1 class="title">Aun no tienes personajes</h1>
            <h3 class="title" style="margin-bottom: 25px;">¡Dale click al boton para comenzar tu aventura!</h3>
            <asp:Button ID="btnFirstCharacter" runat="server" CssClass="btn btn-danger" Text="Crear Personaje" OnClick="charCreation_Click" />
        </div>

        <%}
            else
            {%>
        <div class="container" style="display: flex; justify-content: space-between; margin-bottom: 50px;">
            <asp:Button ID="charCreation" runat="server" CssClass="btn btn-danger" Text="Crear Personaje" OnClick="charCreation_Click" />
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                <button class="btn btn-success" type="submit">Buscar</button>
            </form>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4">
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


                            <p>Vida Máxima: <%#Eval("maxHealth") %></p>

                        </div>
                        <div style="width: 100%; margin-bottom: 10px; margin-left: 30px;">
                            <asp:LinkButton runat="server" ID="btnDetail" CommandArgument='<%#Eval("id")%>' CssClass="btn btn-danger size" Text="Detalle" OnClick="btnDetail_Click"></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnDelete" CommandArgument='<%#Eval("id")%>' CssClass="btn btn-danger size" Text="Eliminar" OnClick="btnDelete_Click"></asp:LinkButton>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
        <%}%>
    </div>
    <script src="Scripts/webform.js"></script>
</asp:Content>
