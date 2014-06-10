<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Camere.aspx.cs" Inherits="Pages_Camere" %>

<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Image ID="Image1" runat="server" CssClass="Camere" 
        ImageUrl="~/Images/cam1.jpg" /><asp:Image ID="Image2" runat="server" 
        CssClass="Camere" ImageUrl="~/Images/cam2.jpg" /><asp:Image
        ID="Image3" runat="server" CssClass="Camere" 
        ImageUrl="~/Images/cam3.jpg" /><asp:Image ID="Image4" runat="server" 
        CssClass="Camere" ImageUrl="~/Images/cam4.jpg" />
    <asp:Image ID="Image5"
            runat="server" CssClass="Camere" ImageUrl="~/Images/cam5.jpg" />
    <asp:Image ID="Image6" runat="server" CssClass="Camere" 
        ImageUrl="~/Images/cam6.jpg" /><asp:Image ID="Image7" runat="server" 
        CssClass="Camere" ImageUrl="~/Images/cam7.jpg" /><asp:Image
                ID="Image8" runat="server" CssClass="Camere" 
        ImageUrl="~/Images/cam8.jpg" />
    
    <DayPilot:DayPilotScheduler ID="DayPilotScheduler1" 
  runat="server" 
  DataSourceID="SqlDataSource1"
  DataStartField="Data1" 
  DataEndField="Data2" 
  DataTextField="IdCam" 
  DataValueField="IdCam" 
  DataResourceField="IdCam" 
  StartDate="2013-01-01"
  CellDuration="1440" 
  Days="100" CellWidth="25" EventBackColor = "Silver" BorderColor="#666666" 
        CellGroupBy="Month" DurationBarColor="Silver" EventBorderColor="Gray" 
        EventFontColor="Silver" >
    <Resources> 
      <DayPilot:Resource Name="Camera 1" Value="1" /> 
      <DayPilot:Resource Name="Camera 2" Value="2" /> 
      <DayPilot:Resource Name="Camera 3" Value="3" /> 
      <DayPilot:Resource Name="Camera 4" Value="4" /> 
      <DayPilot:Resource Name="Camera 5" Value="5" /> 
      <DayPilot:Resource Name="Camera 6" Value="6" /> 
      <DayPilot:Resource Name="Camera 7" Value="7" /> 
      <DayPilot:Resource Name="Camera 8" Value="8" /> 
    </Resources> 
    </DayPilot:DayPilotScheduler>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Rezervari-Conexiune %>" 
        SelectCommand="SELECT [IdCam], [Data1], [Data2] FROM [Rez]">
    </asp:SqlDataSource>
</asp:Content>

