<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="CheapShop.PlaceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">
    <link href="Style/Faq.css" rel="stylesheet" />

      <form id="form1" runat="server">
        <div>


            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Order Id :</td>
                    <td>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Order Date :</td>
                    <td>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>


        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Height="50px"  ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="sno" HeaderText="S.No" />
                <asp:BoundField DataField="Id" HeaderText="Product ID" />
                <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                <asp:BoundField DataField="product_price" HeaderText="Price" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="product_image" HeaderText="Image" />
                <asp:BoundField DataField="totalprice" HeaderText="Total Price" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Height="50px" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <table border="1px" >
            <tr>
                <td class="auto-style4">Type your Address:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="99px" TextMode="MultiLine" Width="445px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Contact No :</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="42px" Width="206px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="placeOrder1" runat="server"  Text="Place Order" Width="149px" OnClick="placeOrder1_Click" />
    </form>

     
</asp:Content>
