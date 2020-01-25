<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="CheapShop.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">
    <form id="adminHomeForm" runat="server">
        
      
        <div>

           
            <asp:Button ID="showUserButton" runat="server" Text="Show Registered User" OnClick="showUserButton_Click" />
            <br />
            <br />
             <asp:Button ID="uploadItemButton" runat="server" Text="Upload Product" OnClick="uploadItemButton_Click" />
            <br />
            <br />
            <asp:Button ID="showOrderButton" runat="server" Text="Show Order" OnClick="showOrderButton_Click" />

        </div>
    
   
    </form>

</asp:Content>
