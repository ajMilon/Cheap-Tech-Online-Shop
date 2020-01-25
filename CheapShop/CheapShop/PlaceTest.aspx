<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceTest.aspx.cs" Inherits="CheapShop.PlaceTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>

            



            


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MaintabConnectionString %>" SelectCommand="SELECT * FROM [orderdetails] WHERE ([orderid] = @orderid)">
                <SelectParameters>
                    <asp:SessionParameter Name="orderid" SessionField="value" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="orderid" HeaderText="orderid" SortExpression="orderid" />
                    <asp:BoundField DataField="sno" HeaderText="sno" SortExpression="sno" />
                    <asp:BoundField DataField="productid" HeaderText="productid" SortExpression="productid" />
                    <asp:BoundField DataField="productname" HeaderText="productname" SortExpression="productname" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="dateoforder" HeaderText="dateoforder" SortExpression="dateoforder" />
                </Columns>
            </asp:GridView>
            <br />
            <br />

            



            


        </div>
    </form>
    
</body>
</html>
