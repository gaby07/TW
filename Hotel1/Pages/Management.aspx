<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Management.aspx.cs" Inherits="Pages_Management" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <br />

    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
        Width="1046px" BackColor="White" BorderColor="White"  
        ForeColor="Black">
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
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowSelectButton="True" />
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
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id" DataSourceID="SqlDataSource2" Width="1022px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                            SortExpression="Id" />
                        <asp:BoundField DataField="Tip" HeaderText="Tip" SortExpression="Tip" />
                        <asp:BoundField DataField="Pret" HeaderText="Pret" SortExpression="Pret" />
                        <asp:BoundField DataField="AC" HeaderText="AC" SortExpression="AC" />
                        <asp:BoundField DataField="Vedere" HeaderText="Vedere" 
                            SortExpression="Vedere" />
                        <asp:BoundField DataField="Imagine" HeaderText="Imagine" 
                            SortExpression="Imagine" />
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
                    DeleteCommand="DELETE FROM [Camere] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [Camere] ([Id], [Tip], [Pret], [AC], [Vedere], [Imagine]) VALUES (@Id, @Tip, @Pret, @AC, @Vedere, @Imagine)" 
                    SelectCommand="SELECT * FROM [Camere] ORDER BY [Id]" 
                    UpdateCommand="UPDATE [Camere] SET [Tip] = @Tip, [Pret] = @Pret, [AC] = @AC, [Vedere] = @Vedere, [Imagine] = @Imagine WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="Tip" Type="String" />
                        <asp:Parameter Name="Pret" Type="Int32" />
                        <asp:Parameter Name="AC" Type="String" />
                        <asp:Parameter Name="Vedere" Type="String" />
                        <asp:Parameter Name="Imagine" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Tip" Type="String" />
                        <asp:Parameter Name="Pret" Type="Int32" />
                        <asp:Parameter Name="AC" Type="String" />
                        <asp:Parameter Name="Vedere" Type="String" />
                        <asp:Parameter Name="Imagine" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Adauga" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtTip" runat="server" Width="110px"></asp:TextBox>
                <asp:TextBox ID="txtPret" runat="server" Width="70px"></asp:TextBox>
                <asp:TextBox ID="txtAC" runat="server" Width="70px"></asp:TextBox>
                <asp:TextBox ID="txtVedere" runat="server" Width="110px"></asp:TextBox>
                <asp:TextBox ID="txtImagine" runat="server"></asp:TextBox>
            </ContentTemplate>
        </asp:TabPanel>
        <asp:TabPanel runat="server" HeaderText="Rezervari" ID="TabPanel3">
            <ContentTemplate>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id" DataSourceID="SqlDataSource3" Width="1024px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowSelectButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="IdCam" HeaderText="IdCam" SortExpression="IdCam" />
                        <asp:BoundField DataField="Data1" HeaderText="Data1" SortExpression="Data1" />
                        <asp:BoundField DataField="Data2" HeaderText="Data2" SortExpression="Data2" />
                        <asp:BoundField DataField="Nume" HeaderText="Nume" SortExpression="Nume" />
                        <asp:BoundField DataField="CNP" HeaderText="CNP" SortExpression="CNP" />
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
                    DeleteCommand="DELETE FROM [Rez] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [Rez] ([IdCam], [Data1], [Data2], [Nume], [CNP], [Buletin], [Adresa], [Telefon], [Mail]) VALUES (@IdCam, @Data1, @Data2, @Nume, @CNP, @Buletin, @Adresa, @Telefon, @Mail)" 
                    SelectCommand="SELECT * FROM [Rez] ORDER BY [Id]" 
                    UpdateCommand="UPDATE [Rez] SET [IdCam] = @IdCam, [Data1] = @Data1, [Data2] = @Data2, [Nume] = @Nume, [CNP] = @CNP, [Buletin] = @Buletin, [Adresa] = @Adresa, [Telefon] = @Telefon, [Mail] = @Mail WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IdCam" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="Data1" />
                        <asp:Parameter DbType="Date" Name="Data2" />
                        <asp:Parameter Name="Nume" Type="String" />
                        <asp:Parameter Name="CNP" Type="String" />
                        <asp:Parameter Name="Buletin" Type="String" />
                        <asp:Parameter Name="Adresa" Type="String" />
                        <asp:Parameter Name="Telefon" Type="String" />
                        <asp:Parameter Name="Mail" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="IdCam" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="Data1" />
                        <asp:Parameter DbType="Date" Name="Data2" />
                        <asp:Parameter Name="Nume" Type="String" />
                        <asp:Parameter Name="CNP" Type="String" />
                        <asp:Parameter Name="Buletin" Type="String" />
                        <asp:Parameter Name="Adresa" Type="String" />
                        <asp:Parameter Name="Telefon" Type="String" />
                        <asp:Parameter Name="Mail" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:TabPanel>
    </asp:TabContainer>

</asp:Content>

