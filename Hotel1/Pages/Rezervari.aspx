﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Rezervari.aspx.cs" Inherits="Pages_Rezervari" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Data1" runat="server" Text="Data 1:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtData1" runat="server" Enabled="False" 
                    ontextchanged="txtData1_TextChanged"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="23px" 
                    ImageUrl="~/Images/calendar.png" Width="23px" 
                    onclick="ImageButton1_Click" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Calendar ID="Calendar1" runat="server" Height="90px" Width="90px" 
                    Visible="False" onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblData2" runat="server" Text="Data 2:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtData2" runat="server" Enabled="False" 
                    ontextchanged="txtData2_TextChanged"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="ImageButton2" runat="server" Height="23px" 
                    ImageUrl="~/Images/calendar.png" Width="23px" 
                    onclick="ImageButton2_Click" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Calendar ID="Calendar2" runat="server" Height="90px" Width="90px" 
                    Visible="False" onselectionchanged="Calendar2_SelectionChanged"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCam" runat="server" Text="Tip camera:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCam" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlCam_SelectedIndexChanged">
                    <asp:ListItem>single</asp:ListItem>
                    <asp:ListItem Value="dubla pat matrimonial">dubla cu pat matrimonial</asp:ListItem>
                    <asp:ListItem Value="dubla doua paturi">dubla cu doua paturi</asp:ListItem>
                    <asp:ListItem>apartament</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Pret:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlPret" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlCam_SelectedIndexChanged">
                    <asp:ListItem>orice</asp:ListItem>
                    <asp:ListItem Value="200|300">200 - 300 RON</asp:ListItem>
                    <asp:ListItem Value="300|400">300 - 400 RON</asp:ListItem>
                    <asp:ListItem Value="400|600">400 - 600 RON</asp:ListItem>
                    <asp:ListItem Value="600|1000">peste 600 RON</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <asp:Panel ID="Panel1" runat="server" >
    </asp:Panel>
</asp:Content>

