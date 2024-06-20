<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="backgroundSelection.aspx.cs" Inherits="TPC_Equipo_10.backgroundSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row row-cols-1 row-cols-md-3 g-4">
        <asp:Repeater runat="server" ID="rptBackgrounds">
            <ItemTemplate>

                <div class="card" style="width: 22%; margin-left: 25px; margin-right: 25px;">
                    <div runat="server" visible='<%# ((int)Eval("id")) == 0 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/05/mtg-doomed-artisan.jpg?fit=1348%2C855&ssl=1" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 1 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://help-action.com/wp-content/uploads/2022/07/crime.png" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 2 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://help-action.com/wp-content/uploads/2022/09/Lone-Missionary-Hermit-Background-5e-1024x536.jpg" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 3 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/07/mtg-intrepid-outlander-5E-DD-background.png?fit=386%2C275&ssl=1" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 4 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/05/mtg-fabled-hero.jpg?fit=1114%2C748&ssl=1" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 5 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://i0.wp.com/nerdarchy.com/wp-content/uploads/2021/07/mtg-sailor-of-means-5E-DD-background.jpg?fit=920%2C606&ssl=1" alt="">
                    </div>
                    <div runat="server" visible='<%# ((int)Eval("id")) == 6 %>'>
                        <img class="card-img-top" style="padding-top: 10px; height: 220px" src="https://help-action.com/wp-content/uploads/2023/04/dnd-solider-background-help-action-dot-com-1024x574.png" alt="">
                    </div>

                    <div class="card-body">
                        <h5 style="text-align: center"><%# Eval("name") %></h5>
                        <p class="card-text"><%# Eval("desc") %>.</p>

                        <div runat="server" visible='<%# ((int)Eval("id")) == 0 %>'>
                            <p class="card-text">Recibes +2 a Persuacion e Investigacion.</p>
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("id")) == 1 %>'>
                            <p class="card-text">Recibes +2 a Sigilo e Intimidacion.</p>
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("id")) == 2 %>'>
                            <p class="card-text">Recibes +2 a Supervivencia y Percepcion.</p>
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("id")) == 3 %>'>
                            <p class="card-text">Recibes +2 a Atletismo y Supervivencia.</p>
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("id")) == 4 %>'>
                            <p class="card-text">Recibes +2 a Persuacion y Atletismo.</p>
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("id")) == 5 %>'>
                            <p class="card-text">Recibes +2 a Supervivencia y Percepcion.</p>
                        </div>
                        <div runat="server" visible='<%# ((int)Eval("id")) == 6 %>'>
                            <p class="card-text">Recibes +2 a Acrobacias e Intimidacion.</p>
                        </div>

                        <p class="card-text">Oro inicial: <%# Eval("initialGold") %> monedas de oro.</p>

                        <asp:LinkButton ID="confirmBackground_btn" CommandArgument='<%# Eval("id")%>' runat="server" CssClass="btn btn-danger" OnClick="confirmBackground_btn_Click" Text="Seleccionar" />

                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>


</asp:Content>
