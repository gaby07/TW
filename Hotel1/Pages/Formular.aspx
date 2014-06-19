<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Formular.aspx.cs" Inherits="Pages_Formular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 137px;
            line-height:3px;
        }
    </style>
    <script type="text/javascript" src="http://slideshow.triptracker.net/slide.js"></script>
    <script type="text/javascript">
        <!--
        var viewer = new PhotoViewer();
        viewer.disableEmailLink();
        viewer.disablePhotoLink();
        viewer.disableToolbar();

        var text = '<%= Session["Img"] %>';
        var img = text.split("|");
        for (i = 0; i < img.length-1; i++) {
            viewer.add(img[i]);
        }
        -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <a href="javascript:void(viewer.show(0))">
        <asp:Image ID="Image1" runat="server" CssClass="CImg" />
    </a>
    <br />
    <asp:Label ID="lblTip" runat="server" CssClass="CTip"></asp:Label>
    <br />
    <asp:Label ID="lblDetalii" runat="server" CssClass="CDescr"></asp:Label>
    <br />
    <asp:Label ID="lblVedere" runat="server" CssClass="CDescr"></asp:Label>
    <br />
    <asp:Label ID="lblPret" runat="server" CssClass="CPret"></asp:Label>
</div>
<br style="clear:both"/>
    <asp:Label ID="Label2" runat="server" CssClass="CTip" Text="Facilitati"></asp:Label>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
    <br />
    <asp:Label ID="Label9" runat="server" CssClass="CTip" Text="Rezerva acum"></asp:Label>
    <br />
    <br />
<table>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" CssClass="CDescr" Text="Nume: "></asp:Label>
        </td>
        <td class="style1">
            <asp:TextBox ID="txtNume" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="rez" ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="*" ControlToValidate="txtNume"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" CssClass="CDescr" Text="CNP: "></asp:Label>
        </td>
        <td class="style1">
            <asp:TextBox ID="txtCNP" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="rez" ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="*" ControlToValidate="txtCNP"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" CssClass="CDescr" 
                Text="Serie, nr. buletin: "></asp:Label>
        </td>
        <td class="style1">
            <asp:TextBox ID="txtBuletin" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="rez" ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="*" ControlToValidate="txtBuletin"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label6" runat="server" CssClass="CDescr" Text="Adresa: "></asp:Label>
        </td>
        <td class="style1">
            <asp:TextBox ID="txtAdr" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="rez" ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="*" ControlToValidate="txtAdr"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label7" runat="server" CssClass="CDescr" Text="Nr. telefon: "></asp:Label>
        </td>
        <td class="style1">
            <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="rez" ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="*" ControlToValidate="txtTel"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label8" runat="server" CssClass="CDescr" Text="E-mail:"></asp:Label>
        </td>
        <td class="style1">
            <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="rez" ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="*" ControlToValidate="txtMail"></asp:RequiredFieldValidator>
        </td>
    </tr>
</table>
    <asp:Label ID="lblRes" runat="server"></asp:Label>
    <br />
    <asp:Button ValidationGroup="rez" ID="btnRez" runat="server" onclick="btnRez_Click" Text="Rezerva" />
</asp:Content>

