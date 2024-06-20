<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Characters.aspx.cs" Inherits="TPC_Equipo_10.Characters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="container" style="display: flex; justify-content: space-between; margin-bottom:50px;">
            <asp:Button ID="charCreation" runat="server" CssClass="btn btn-danger" Text="Crear Personaje" OnClick="charCreation_Click" />
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                <button class="btn btn-success" type="submit">Buscar</button>
            </form>
        </div>

        <div class="row row-cols-1 row-cols-md-3 g-4">
            <asp:Repeater runat="server" ID="rptCharacters">
                <ItemTemplate>

                    <div class="card" style="width: 22%; margin-left: 25px; margin-right: 25px;">
                        <div runat="server" visible='<%# ((int)Eval("chrClass.id")) == 0 %>'>
                            <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://www.dndbeyond.com/avatars/thumbnails/6/359/420/618/636272697874197438.png" alt="">
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("chrClass.id")) == 1 %>'>
                            <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/6f055b11-30d4-4a48-85a1-774dc8d792cd/dg308lq-774ebb76-101d-49e2-afa9-6f9e523f7fc4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzZmMDU1YjExLTMwZDQtNGE0OC04NWExLTc3NGRjOGQ3OTJjZFwvZGczMDhscS03NzRlYmI3Ni0xMDFkLTQ5ZTItYWZhOS02ZjllNTIzZjdmYzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.hFpv3hPHv-S99ivnKkB469BJHKMQFaIDIwNDVlh7Wyo" alt="">
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("chrClass.id")) == 2 %>'>
                            <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://www.worldanvil.com/uploads/images/5306b35bfec003350e5eaa79e3b5fa2e.png" alt="">
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("chrClass.id")) == 3 %>'>
                            <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2016/04/Fe-PirateRogue.png?fit=635%2C753&ssl=1" alt="">
                        </div>
                        <div class="card-body">

                            <h5 style="text-align: center"><%# Eval("name") %></h5>
                            <p>Clase: <%#Eval("chrClass.name") %></p>
                            <p>Raza: <%#Eval("race.name") %></p>
                            <p>Vida: <%#Eval("maxHealth") %></p>

                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
