<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ClassSelection.aspx.cs" Inherits="TPC_Equipo_10.ClassSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .containerInfo {
            background-color: beige;
            width: 40%;
            margin-bottom: 25px;
            margin-left: auto;
            margin-right: auto;
        }

        .classInfo {
            margin-bottom: 30px;
            border-bottom: 3px solid;
            border-color: azure;
            padding-bottom: 15px;
            background-color: beige;
            width: 80%;
        }

        .classImg {
            width: 75%;
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


    <div class="containerInfo" style="text-align: center;">
        <h3 class="title">Selecciona tu Clase:</h3>
    </div>

    <div class="containter" style="justify-content: center">
        <asp:Repeater runat="server" ID="rptClass">
            <ItemTemplate>

                <div class="classInfo" style="display: flex">
                    <h4 class="title" style="justify-content: center"><%# Eval("name")%></h4>
                    <div style="display: flex; justify-content: left">
                        <div runat="server" visible='<%# ((int)Eval("id")) == 0 %>'>
                            <img class="classImg" src="https://www.dndbeyond.com/avatars/thumbnails/6/359/420/618/636272697874197438.png" alt="">
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("id")) == 1 %>'>
                            <img class="classImg" src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/6f055b11-30d4-4a48-85a1-774dc8d792cd/dg308lq-774ebb76-101d-49e2-afa9-6f9e523f7fc4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzZmMDU1YjExLTMwZDQtNGE0OC04NWExLTc3NGRjOGQ3OTJjZFwvZGczMDhscS03NzRlYmI3Ni0xMDFkLTQ5ZTItYWZhOS02ZjllNTIzZjdmYzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.hFpv3hPHv-S99ivnKkB469BJHKMQFaIDIwNDVlh7Wyo" alt="">
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("id")) == 2 %>'>
                            <img class="classImg" src="https://www.worldanvil.com/uploads/images/5306b35bfec003350e5eaa79e3b5fa2e.png" alt="">
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("id")) == 3 %>'>
                            <img class="classImg" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2016/04/Fe-PirateRogue.png?fit=635%2C753&ssl=1" alt="">
                        </div>
                        <div style="justify-content: right">
                            <p><%# Eval("desc")%></p>

                            <h4>Puntos de vida por nivel: <%# Eval("classHealth") %> + Modificador de Constitucion</h4>
                            <h4>Habilidad Especial: <%# Eval("specialName")%></h4>
                            <p><%# Eval("specialDesc")%></p>

                            <asp:LinkButton ID="confirmClass_btn" CommandArgument='<%# Eval("id")%>' runat="server" CssClass="btn btn-danger" OnClick="confirmClass_btn_Click" Text="Seleccionar" />
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
