<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CharacterCreator.aspx.cs" Inherits="TPC_Equipo_10.CharacterCreator" %>

<%@ Import Namespace="DomainModel" %>
<%@ Import Namespace="DBAccess" %>
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

    <div class="containerInfo">
        <h1 class="title" style="display: flex; justify-content: center">¡Nace una nueva leyenda! </h1>
    </div>
    <div class="containerInfo">
        <h3 class="title">Selecciona tu raza: </h3>
    </div>
    <asp:Repeater runat="server" ID="rptRace" OnItemDataBound="rptRace_ItemDataBound">
        <ItemTemplate>

            <div class="containerInfo" style=" display: flex;justify-content: center">
                <h4 class="title" style="text-align: center"><%# Eval("name")%></h4>
                <div style="justify-content: left">
                    <div  runat="server" visible='<%# ((int)Eval("id")) == 0 %>'>
                        <img style="width: 350px; height:550px;" src="https://i.imgur.com/D9h7V1m.png" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 1 %>'>
                        <img style="width: 350px; height:550px;"  src="https://i.imgur.com/7Ax3AZe.png" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 2 %>'>
                        <img style="width: 350px; height:550px;"  src="https://www.dndbeyond.com/avatars/thumbnails/6/340/420/618/636272677995471928.png" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 3 %>'>
                        <img style="width: 350px; height:550px;"  src="https://www.dndbeyond.com/avatars/thumbnails/6/254/420/618/636271781394265550.png" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 4 %>'>
                        <img style="width: 350px; height:550px;"  src="https://www.dndbeyond.com/avatars/thumbnails/7/641/420/618/636287076637981942.png" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 5 %>'>
                        <img style="width: 350px; height:550px;"  src="https://images.squarespace-cdn.com/content/v1/5e3843beb37a0716cf512998/cc8512f0-3130-4533-8786-2872de9edbcc/halfling-urban.png" alt="">
                    </div>
                    <div style="justify-content: right">
                        <p><%# Eval("desc")%></p>

                        <asp:Repeater runat="server" ID="rptAbilities">
                            <ItemTemplate>
                                <h5>Pasiva: +2 a su <%# Eval("name")%></h5>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:LinkButton ID="confirmRace_btn" CommandArgument='<%# Eval("id")%>' runat="server" CssClass="btn btn-danger" OnClick="confirmRace_btn_Click" Text="Seleccionar" />
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
