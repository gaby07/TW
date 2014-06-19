<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Formular.aspx.cs" Inherits="Pages_Formular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 137px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<br />
<table>
    <tr>
        <td>
            Nume:
        </td>
        <td class="style1">
            <asp:TextBox ID="txtNume" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="*" ControlToValidate="txtNume"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            CNP:
        </td>
        <td class="style1">
            <asp:TextBox ID="txtCNP" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="*" ControlToValidate="txtCNP"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Serie, nr. buletin:</td>
        <td class="style1">
            <asp:TextBox ID="txtBuletin" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="*" ControlToValidate="txtBuletin"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Adresa:</td>
        <td class="style1">
            <asp:TextBox ID="txtAdr" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="*" ControlToValidate="txtAdr"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Numar telefon:</td>
        <td class="style1">
            <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="*" ControlToValidate="txtTel"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Adresa e-mail:</td>
        <td class="style1">
            <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="*" ControlToValidate="txtMail"></asp:RequiredFieldValidator>
        </td>
    </tr>
</table>
    <asp:Label ID="lblRes" runat="server"></asp:Label>
    <br />
    <asp:Button ID="btnRez" runat="server" onclick="btnRez_Click" Text="Rezerva" />
</asp:Content>

