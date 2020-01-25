<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="CheapShop.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">

     <link href="Style/Login.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <center>
      
        <div class="Login">
            <br />
          <div class="Login_form">
              <h1>Admin Login</h1>
              <asp:TextBox ID="userNameLoginAdmin" runat="server" placeholder="USERNAME" CssClass ="Login_un"></asp:TextBox>
              <br /><br />
              <asp:TextBox ID="passwordLoginAdmin" runat="server" placeholder="PASSWORD" CssClass ="Login_ps" TextMode="Password"></asp:TextBox>
              <br /><br />
              <asp:Button ID="adminLoginButton" runat="server" Text="LOGIN!" CssClass="Login_btn" OnClick="adminLoginButton_Click" />;
              <br /><br />
              


              <br />
            
              


          </div>
            
        </div>
     </center>
     
    </form>
</asp:Content>
