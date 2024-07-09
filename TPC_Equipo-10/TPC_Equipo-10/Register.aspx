<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TPC_Equipo_10.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .btn-danger {
            margin-right: 5px;
        }

        .title {
            font-family: "Oswald", sans-serif;
            font-optical-sizing: auto;
            font-weight: 500;
            font-style: normal;
        }

        .icon {
            image-rendering: pixelated;
            width: 100px;
            background-color: antiquewhite;
            outline: 2px solid;
            outline-color: darkkhaki;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-md-center align-items-center vh-100">
        <div class="container form-control" style="padding-top: 25px; border-width: medium; border-color: black;">
            <div class="mb-3 row">
                <h4 class="title" style="display: flex; justify-content: center">¡UNETE A LA AVENTURA!</h4>

                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false" />

                <label for="inputUsername" class="col-sm-2 col-form-label">Usuario:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="inputUsername" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputMail" class="col-sm-2 col-form-label">Correo electrónico:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="inputMail" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="inputPassword" runat="server" TextMode="Password" CssClass="form-control" />
                </div>
            </div>
            <div class="mb-3 row">
                <label for="confirmPassword" class="col-sm-2 col-form-label">Confirmar contraseña:</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="confirmPassword" runat="server" TextMode="Password" CssClass="form-control" />
                </div>
            </div>
            <div class="mb-3 row">
                <div class="container text-center">
                    <div class="row">
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb0" Checked="true" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb0.ClientID %>" class="img-radio">
                                    <asp:Image ID="img0" runat="server" ImageUrl="~/Sprites/Icons/0.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb1" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb1.ClientID %>" class="img-radio">
                                    <asp:Image ID="img1" runat="server" ImageUrl="~/Sprites/Icons/1.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb2" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb2.ClientID %>" class="img-radio">
                                    <asp:Image ID="img2" runat="server" ImageUrl="~/Sprites/Icons/2.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb3" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb3.ClientID %>" class="img-radio">
                                    <asp:Image ID="img3" runat="server" ImageUrl="~/Sprites/Icons/3.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb4" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb4.ClientID %>" class="img-radio">
                                    <asp:Image ID="img4" runat="server" ImageUrl="~/Sprites/Icons/4.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb5" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb5.ClientID %>" class="img-radio">
                                    <asp:Image ID="img5" runat="server" ImageUrl="~/Sprites/Icons/5.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb6" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb6.ClientID %>" class="img-radio">
                                    <asp:Image ID="img6" runat="server" ImageUrl="~/Sprites/Icons/6.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb7" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb7.ClientID %>" class="img-radio">
                                    <asp:Image ID="img7" runat="server" ImageUrl="~/Sprites/Icons/7.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb8" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb8.ClientID %>" class="img-radio">
                                    <asp:Image ID="img8" runat="server" ImageUrl="~/Sprites/Icons/8.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                        <div class="col">
                            <asp:RadioButton runat="server" GroupName="icon" ID="rb9" OnCheckedChanged="icon_CheckedChanged" />
                            <div class="col">
                                <label for="<%= rb9.ClientID %>" class="img-radio">
                                    <asp:Image ID="img9" runat="server" ImageUrl="~/Sprites/Icons/9.png" Style="width: 100px" CssClass="icon" />
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mb-3 row">
                <div class="container" style="display: flex; justify-content: center">
                    <asp:Button ID="btnBack" CssClass="btn btn-danger" Text="Volver" OnClick="btnBack_Click" runat="server" />
                    <asp:Button ID="btnRegisterConfirm" CssClass="btn btn-danger" Text="Registrarse" OnClick="btnRegisterConfirm_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
