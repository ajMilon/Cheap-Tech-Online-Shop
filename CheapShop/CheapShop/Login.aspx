<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CheapShop.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">
    <link href="Style/Login.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <center>
      
        <div class="Login">
            <br />
          <div class="Login_form">
              <h1>Secure Login</h1>
              <asp:TextBox ID="userNameLogin" runat="server" placeholder="USERNAME" CssClass ="Login_un"></asp:TextBox>
              <br /><br />
              <asp:TextBox ID="passwordLogin" runat="server" placeholder="PASSWORD" CssClass ="Login_ps"   TextMode="Password"></asp:TextBox>
              <br /><br />
              <asp:Button ID="Button1" runat="server" Text="LOGIN!" CssClass="Login_btn" OnClick="Button1_Click" />;
              <br /><br />
              


              <br />
             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx">Don&#39;t have any account, Register now</asp:HyperLink>
              


          </div>
            
        </div>
     </center>
     
    </form>
</asp:Content>
