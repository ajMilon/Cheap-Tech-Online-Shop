<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="CheapShop.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">
   
     <form id="form1" runat="server">
        <div>
           
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Products.aspx">Continue shopping</asp:HyperLink>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="50px" Width="100px" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" >
                <Columns>
                    <asp:BoundField DataField="sno" HeaderText="S.No">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Id" HeaderText="Product ID">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="product_name" HeaderText="Product Name">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="product_price" HeaderText="Price">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                    <asp:ImageField DataImageUrlField="product_image" HeaderText="Product Image">
                        <ControlStyle BorderWidth="1px" Height="200px" Width="200px" />
                        <ItemStyle HorizontalAlign="Center" Height="50px" BorderWidth="2px" Width="50px" Wrap="False"  />
                    </asp:ImageField>
                    <asp:BoundField DataField="totalprice" HeaderText="Total Price" />
                    <asp:CommandField DeleteImageUrl="~/Images/delete.jpg" ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" Height="50px" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"  />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" Height="50px" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:Button ID="checkOut" runat="server" OnClick="checkOut_Click" Text="Check Out" Width="106px" />
            <br />
            
        </div>
    </form>
</asp:Content>
