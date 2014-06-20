<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Camere.aspx.cs" Inherits="Pages_Camere" %>

<%@ Register assembly="DayPilot" namespace="DayPilot.Web.Ui" tagprefix="DayPilot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
      <DayPilot:Resource Name="Cam. single" Value="1" /> 
      <DayPilot:Resource Name="Cam. single lux" Value="2" /> 
      <DayPilot:Resource Name="Cam. dubla cu pat matrimonial" Value="3" /> 
      <DayPilot:Resource Name="Cam. dubla cu pat matrimonial lux" Value="4" /> 
      <DayPilot:Resource Name="Cam. dubla cu doua paturi" Value="5" /> 
      <DayPilot:Resource Name="Cam. dubla cu doua paturi lux" Value="6" /> 
      <DayPilot:Resource Name="Apartament" Value="7" /> 
      <DayPilot:Resource Name="Apartament lux" Value="8" /> 
      <DayPilot:Resource Name="Apartament + sala sedinte" Value="9" /> 
    </Resources> 
    </DayPilot:DayPilotScheduler>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Rezervari-Conexiune %>" 
        SelectCommand="SELECT [IdCam], [Data1], [Data2] FROM [Rezervari] where [Stare] <> 'cerere' and [Stare] <> 'anulata'">
    </asp:SqlDataSource>
</asp:Content>

