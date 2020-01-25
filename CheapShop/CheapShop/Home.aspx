<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CheapShop.Home" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">
    <form id="form1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
     <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick">

    </asp:Timer>
    <asp:Image ID="Image1" Height="600px" Width="1000px" runat="server" />
     
</ContentTemplate>
        </asp:UpdatePanel>
   
        </form>
</asp:Content>

