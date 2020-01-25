<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="CheapShop.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">
    <form id="form1" runat="server">
        <div>
           
            <asp:DataList ID="DataList1" runat="server" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="5px" CellPadding="3" CellSpacing="2" DataKeyField="Id" DataSourceID="SqlDataSource1" GridLines="Both" RepeatColumns="5" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <EditItemStyle BorderWidth="2px" />
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" BorderWidth="1px" />
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="text-left" style="height: 18px">Product ID:<asp:Label ID="Label2" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">Product Name:<asp:Label ID="Label3" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">
                                <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("product_image") %>' Width="200px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">Category:<asp:Label ID="Label4" runat="server" Text='<%# Eval("poduct_cat") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">Quantity:<asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">TK:<asp:Label ID="Label6" runat="server" Text='<%# Eval("product_price") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="add" Height="40px" ImageUrl="~/Images/carta.jpg" Width="150px" CommandArgument='<%# Eval("Id") %>'   />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" BorderWidth="2px" />
                <SeparatorStyle BorderWidth="2px" />
            </asp:DataList>
            <br />
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MaintabConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
