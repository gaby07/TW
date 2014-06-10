<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inregistrare.aspx.cs" Inherits="Pages_Inregistrare" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
    <tr>
        <td>
            Nume:</td>

        <td>
            <asp:TextBox ID="txtNume" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="inreg" ID="RequiredFieldValidator1" runat="server" 
               ControlToValidate="txtNume" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
        <td>
            Parola:</td>
        <td>
            <asp:TextBox ID="txtParola" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="inreg" ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtParola" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
        <td>
            Confirmare parola:</td>
        <td>
            <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="inreg" ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtConfirm" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
        <td>
            Email:</td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="inreg" ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
        <td>
            <asp:Button ValidationGroup="inreg" ID="btnInreg" runat="server" onclick="btnInreg_Click" 
                Text="Register" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtParola" ControlToValidate="txtConfirm" 
                ErrorMessage="Prola trebuie sa se potriveasca"></asp:CompareValidator>
            <br />
            <asp:Label ID="lblRez" runat="server"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

