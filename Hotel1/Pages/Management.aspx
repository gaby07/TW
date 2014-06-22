﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Management.aspx.cs" Inherits="Pages_Management" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <br />

    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3" 
        Width="1115px" BackColor="#E9E9E9" BorderColor="#D1D1D1"  
        ForeColor="Black" BorderStyle="None">
        <asp:TabPanel runat="server" HeaderText="Utilizatori" ID="TabPanel1">
            <HeaderTemplate>
                Utilizatori
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id" DataSourceID="SqlDataSource1" Width="1013px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="nume" HeaderText="nume" SortExpression="nume" />
                        <asp:BoundField DataField="tip" HeaderText="tip" SortExpression="tip" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Rezervari-Conexiune %>" 
                    DeleteCommand="DELETE FROM [utilizatori] WHERE [id] = @id" 
                    InsertCommand="INSERT INTO [utilizatori] ([nume], [tip], [email]) VALUES (@nume, @tip, @email)" 
                    SelectCommand="SELECT [id], [nume], [tip], [email] FROM [utilizatori] ORDER BY [id]" 
                    UpdateCommand="UPDATE [utilizatori] SET [nume] = @nume, [tip] = @tip, [email] = @email WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="nume" Type="String" />
                        <asp:Parameter Name="tip" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="nume" Type="String" />
                        <asp:Parameter Name="tip" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" HeaderText="Camere" ID="TabPanel2">
            <HeaderTemplate>
                Camere
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id" DataSourceID="SqlDataSource2" Width="1086px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                            SortExpression="Id" InsertVisible="False" />
                        <asp:BoundField DataField="Tip" HeaderText="Tip" SortExpression="Tip" />
                        <asp:BoundField DataField="Detalii" HeaderText="Detalii" 
                            SortExpression="Detalii" />
                        <asp:BoundField DataField="Facilitati" HeaderText="Facilitati" 
                            SortExpression="Facilitati" />
                        <asp:BoundField DataField="Vedere" HeaderText="Vedere" 
                            SortExpression="Vedere" />
                        <asp:BoundField DataField="Imagini" HeaderText="Imagini" 
                            SortExpression="Imagini" />
                        <asp:BoundField DataField="Pret" HeaderText="Pret" SortExpression="Pret" />
                        <asp:BoundField DataField="Nr" HeaderText="Nr" SortExpression="Nr" />
                        <asp:BoundField DataField="NrOv" HeaderText="NrOv" SortExpression="NrOv" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Rezervari-Conexiune %>" 
                    SelectCommand="SELECT * FROM [Camere]" 
                    DeleteCommand="DELETE FROM [Camere] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [Camere] ([Tip], [Detalii], [Facilitati], [Vedere], [Imagini], [Pret], [Nr], [NrOv]) VALUES (@Tip, @Detalii, @Facilitati, @Vedere, @Imagini, @Pret, @Nr, @NrOv)" 
                    UpdateCommand="UPDATE [Camere] SET [Tip] = @Tip, [Detalii] = @Detalii, [Facilitati] = @Facilitati, [Vedere] = @Vedere, [Imagini] = @Imagini, [Pret] = @Pret, [Nr] = @Nr, [NrOv] = @NrOv WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Tip" Type="String" />
                        <asp:Parameter Name="Detalii" Type="String" />
                        <asp:Parameter Name="Facilitati" Type="String" />
                        <asp:Parameter Name="Vedere" Type="String" />
                        <asp:Parameter Name="Imagini" Type="String" />
                        <asp:Parameter Name="Pret" Type="Int32" />
                        <asp:Parameter Name="Nr" Type="Int32" />
                        <asp:Parameter Name="NrOv" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Tip" Type="String" />
                        <asp:Parameter Name="Detalii" Type="String" />
                        <asp:Parameter Name="Facilitati" Type="String" />
                        <asp:Parameter Name="Vedere" Type="String" />
                        <asp:Parameter Name="Imagini" Type="String" />
                        <asp:Parameter Name="Pret" Type="Int32" />
                        <asp:Parameter Name="Nr" Type="Int32" />
                        <asp:Parameter Name="NrOv" Type="Int32" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                Adaugare camera<br />
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblTip" runat="server" Text="Tip: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTip" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ad" ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtTip"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDetalii" runat="server" Text="Detalii: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox  ID="txtDetalii" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ad" ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtDetalii"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblFacilitati" runat="server" Text="Facilitati: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFacilitati" runat="server" TextMode="MultiLine" ></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ad" ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtFacilitati"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblVedere" runat="server" Text="Vedere: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtVedere" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ad" ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtVedere"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPret" runat="server" Text="Pret: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPret" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ad" ID="RequiredFieldValidator5" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtPret"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="ad" ID="RegularExpressionValidator1" ControlToValidate="txtPret" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNr" runat="server" Text="Nr camere: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNr" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ad" ID="RequiredFieldValidator7" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtNr"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="ad" ID="RegularExpressionValidator2" ControlToValidate="txtNr" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNrO" runat="server" Text="Nr overbooking: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNrO" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="ad" ID="RequiredFieldValidator6" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtNrO"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="ad" ID="RegularExpressionValidator3" ControlToValidate="txtNrO" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+" ></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>

                <asp:FileUpload ID="AdImg" runat="server" />
                <br />

                <asp:Button ValidationGroup="ad" ID="Button1" runat="server" 
                    onclick="Button1_Click" Text="Adauga" PostBackUrl="~/Pages/Management.aspx" />
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" HeaderText="Cereri" ID="TabPanel3">
            <ContentTemplate>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource3" Width="1088px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                            InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="IdCam" HeaderText="IdCam" SortExpression="IdCam" />
                        <asp:BoundField DataField="Data1" HeaderText="Data1" SortExpression="Data1" />
                        <asp:BoundField DataField="Data2" HeaderText="Data2" SortExpression="Data2" />
                        <asp:BoundField DataField="Nume" HeaderText="Nume" SortExpression="Nume" />
                        <asp:BoundField DataField="CNP" HeaderText="CNP" 
                            SortExpression="CNP" />
                        <asp:BoundField DataField="Buletin" HeaderText="Buletin" 
                            SortExpression="Buletin" />
                        <asp:BoundField DataField="Adresa" HeaderText="Adresa" 
                            SortExpression="Adresa" />
                        <asp:BoundField DataField="Telefon" HeaderText="Telefon" 
                            SortExpression="Telefon" />
                        <asp:BoundField DataField="Mail" HeaderText="Mail" SortExpression="Mail" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Rezervari-Conexiune %>" 
                    
                    
                    SelectCommand="SELECT [Id], [IdCam], [Data1], [Data2], [Nume], [CNP], [Buletin], [Adresa], [Telefon], [Mail] FROM [Rezervari] WHERE ([Stare] = 'cerere')">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="cerere" Name="Stare" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Button ID="Button2" runat="server"  
                    Text="Accepta" onclick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" Text="Respinge" 
                    onclick="Button3_Click" />
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
            <HeaderTemplate>
                Rapoarte
            </HeaderTemplate>
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Data1" runat="server" Text="Check-in:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtData1" runat="server" Enabled="False" 
                                ontextchanged="txtData1_TextChanged"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="23px" 
                                ImageUrl="~/Images/calendar.png" onclick="ImageButton1_Click" Width="23px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Calendar ID="Calendar1" runat="server" Height="90px" 
                                onselectionchanged="Calendar1_SelectionChanged" Visible="False" Width="90px">
                            </asp:Calendar>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblData2" runat="server" Text="Check-out:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtData2" runat="server" Enabled="False" 
                                ontextchanged="txtData2_TextChanged"></asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="23px" 
                                ImageUrl="~/Images/calendar.png" onclick="ImageButton2_Click" Width="23px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Calendar ID="Calendar2" runat="server" Height="90px" 
                                onselectionchanged="Calendar2_SelectionChanged" Visible="False" Width="90px">
                            </asp:Calendar>
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
                                <asp:ListItem Value="0">toate</asp:ListItem>
                                <asp:ListItem Value="1">single</asp:ListItem>
                                <asp:ListItem Value="2">single lux</asp:ListItem>
                                <asp:ListItem Value="3">dubla cu pat matrimonial</asp:ListItem>
                                <asp:ListItem Value="4">dubla cu pat matrimonial lux</asp:ListItem>
                                <asp:ListItem Value="5">dubla cu doua paturi</asp:ListItem>
                                <asp:ListItem Value="6">dubla cu doua paturi lux</asp:ListItem>
                                <asp:ListItem Value="7">apartament</asp:ListItem>
                                <asp:ListItem Value="8">apartament lux</asp:ListItem>
                                <asp:ListItem Value="9">apartament lux + sala sedinte</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tip rezervare:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRez" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="ddlRez_SelectedIndexChanged">
                                <asp:ListItem>toate</asp:ListItem>
                                <asp:ListItem>anulata</asp:ListItem>
                                <asp:ListItem>onorata</asp:ListItem>
                                <asp:ListItem>receptie</asp:ListItem>
                                <asp:ListItem>despagubire</asp:ListItem>
                                <asp:ListItem>rezervare</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="Raport" runat="server" Text="Raport" onclick="Raport_Click" />
                <br />
                <br />
                <asp:Label ID="lblRez" runat="server"></asp:Label>
                <br />
                <asp:Label ID="LblNopti" runat="server"></asp:Label>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5">
            <HeaderTemplate>
                Rezervari
            </HeaderTemplate>
            <ContentTemplate>
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id" DataSourceID="SqlDataSource4" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="1091px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="IdCam" HeaderText="IdCam" SortExpression="IdCam" />
                        <asp:BoundField DataField="Data1" HeaderText="Data1" SortExpression="Data1" />
                        <asp:BoundField DataField="Data2" HeaderText="Data2" SortExpression="Data2" />
                        <asp:BoundField DataField="Nume" HeaderText="Nume" SortExpression="Nume" />
                        <asp:BoundField DataField="CNP" HeaderText="CNP" SortExpression="CNP" />
                        <asp:BoundField DataField="Adresa" HeaderText="Adresa" 
                            SortExpression="Adresa" />
                        <asp:BoundField DataField="Telefon" HeaderText="Telefon" 
                            SortExpression="Telefon" />
                        <asp:BoundField DataField="Mail" HeaderText="Mail" 
                            SortExpression="Mail" />
                        <asp:BoundField DataField="Stare" HeaderText="Stare" 
                            SortExpression="Stare" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                            InsertVisible="False" ReadOnly="True" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:Rezervari-Conexiune %>" 
                    DeleteCommand="DELETE FROM [Rezervari] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [Rezervari] ([IdCam], [Data1], [Data2], [Nume], [CNP], [Adresa], [Telefon], [Mail], [Stare]) VALUES (@IdCam, @Data1, @Data2, @Nume, @CNP, @Adresa, @Telefon, @Mail, @Stare)" 
                    SelectCommand="SELECT [Id], [IdCam], [Data1], [Data2], [Nume], [CNP], [Adresa], [Telefon], [Mail], [Stare] FROM [Rezervari] WhERE [Stare]='rezervare'" 
                    
                    UpdateCommand="UPDATE [Rezervari] SET [IdCam] = @IdCam, [Data1] = @Data1, [Data2] = @Data2, [Nume] = @Nume, [CNP] = @CNP, [Adresa] = @Adresa, [Telefon] = @Telefon, [Mail] = @Mail, [Stare] = @Stare WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IdCam" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="Data1" />
                        <asp:Parameter DbType="Date" Name="Data2" />
                        <asp:Parameter Name="Nume" Type="String" />
                        <asp:Parameter Name="CNP" Type="String" />
                        <asp:Parameter Name="Adresa" Type="String" />
                        <asp:Parameter Name="Telefon" Type="String" />
                        <asp:Parameter Name="Mail" Type="String" />
                        <asp:Parameter Name="Stare" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="IdCam" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="Data1" />
                        <asp:Parameter DbType="Date" Name="Data2" />
                        <asp:Parameter Name="Nume" Type="String" />
                        <asp:Parameter Name="CNP" Type="String" />
                        <asp:Parameter Name="Adresa" Type="String" />
                        <asp:Parameter Name="Telefon" Type="String" />
                        <asp:Parameter Name="Mail" Type="String" />
                        <asp:Parameter Name="Stare" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>

</asp:Content>

