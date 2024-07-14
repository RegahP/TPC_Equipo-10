<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FinishingCharacter.aspx.cs" Inherits="TPC_Equipo_10.FinishingCharacter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex justify-content-md-center align-items-center vh-100">
        <div class="container form-control text-center shadow-lg" style="padding-top: 25px; border-width: medium; border-color: black; width:60%">

            <h4 class="title" style="display: flex; justify-content: center">¡ÚLTIMOS DETALLES!</h4>
            <div class="mb-3 row">
                <div class="container" style="width: 80%">
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false" />
                    <div class="row">
                        <div class="input-group flex-nowrap">
                            <span class="input-group-text" id="addon-wrapping">Nombre</span>
                            <asp:TextBox runat="server" ID="txtName" AutoPostBack="false" CssClass="form-control" Style="width: 25%" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mb-3 row">
                <div class="col-1"></div>
                <div class="col ms-5">
                    <div class="row">
                        <div class="input-group mb-3">
                            <span class="input-group-text">Sexo</span>
                            <div class="input-group-text">
                                <asp:RadioButton runat="server" GroupName="sex" Checked="true" ID="rbSex0" OnCheckedChanged="rbSex_CheckedChanged" />
                                <label class="m-1" for="<%= rbSex0.ClientID %>">Femenino</label>
                            </div>

                            <div class="input-group-text">
                                <asp:RadioButton runat="server" GroupName="sex" ID="rbSex1" OnCheckedChanged="rbSex_CheckedChanged" />
                                <label class="m-1" for="<%= rbSex1.ClientID %>">Masculino</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col ms-4">
                    <div class="row">
                        <div class="input-group mb-3">
                            <span class="input-group-text">Dificultad</span>
                            <div class="input-group-text">
                                <asp:RadioButton runat="server" GroupName="core" Checked="true" ID="rbCore0" OnCheckedChanged="rbCore_CheckedChanged" />
                                <label class="m-1" for="<%= rbCore0.ClientID %>">Softcore</label>
                            </div>

                            <div class="input-group-text">
                                <asp:RadioButton runat="server" GroupName="core" ID="rbCore1" OnCheckedChanged="rbCore_CheckedChanged" />
                                <label class="m-1" for="<%= rbCore1.ClientID %>">Hardcore</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="mb-3 row">
                <div class="form-text">Softcore: Al morir en combate, revives con la mitad de dinero y tu vida se reabastece.</div>
                <div class="form-text">Hardcore: Al morir en combate, tu personaje es destruido permanentemente, aunque será accesible para ver.</div>
            </div>

            <div class="mb-3 row">
                <div class="container" style="display: flex; justify-content: center">
                    <asp:LinkButton runat="server" ID="btnConfirm" CssClass="btn btn-danger mx-2" Text="Confirmar" OnClick="btnConfirm_Click"></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnCancel" CssClass="btn btn-danger mx-2" Text="Cancelar" OnClick="btnCancel_Click"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
