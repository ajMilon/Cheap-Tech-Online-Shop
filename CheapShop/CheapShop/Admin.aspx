<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="CheapShop.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">
   
    <form id="formAdmin" runat="server">

  
    <h3>Add product page</h3>

    <table>
     <!--  <tr> <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MaintabConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource> </tr>

        <tr> -->
            <td>Product name</td>
            <td>
                <asp:TextBox ID="t1" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Product Description</td>
            <td>
                <asp:TextBox ID="t2" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Product Price</td>
            <td>
                <asp:TextBox ID="t3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Product Category</td>
            <td>
                <asp:TextBox ID="t4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Product Quantity</td>
            <td>
                <asp:TextBox ID="t5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Product Image</td>
            <td>
                <asp:FileUpload ID="f1" runat="server" />
            </td>
        </tr>

        <tr>
            <td colspan="2" >
                <asp:Button  ID="upload" runat="server" Text="Upload" OnClick="upload_Click"/>

            </td>
            <td colspan="2" >
                <asp:Button  ID="backToHome" runat="server" Text="Admin   Home" OnClick="backToHome_Click"/>

            </td>
        </tr>

    </table>
          </form>

</asp:Content>
