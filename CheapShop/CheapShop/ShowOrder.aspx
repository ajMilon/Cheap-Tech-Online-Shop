﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="ShowOrder.aspx.cs" Inherits="CheapShop.ShowOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">
     <form id="form1" runat="server">
        <div>

            


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MaintabConnectionString %>"
                SelectCommand="SELECT * FROM [orderaddress]">

            </asp:SqlDataSource>
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" AutoGenerateSelectButton="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True"  OnRowCommand="GridView1_RowCommand"  >
                <Columns>
                    <asp:BoundField DataField="orderid" HeaderText="Order Id" SortExpression="orderid" />
                    <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                    <asp:BoundField DataField="mobilenumber" HeaderText="Mobile Number" SortExpression="mobilenumber" />
                    <asp:ButtonField CommandName="details" Text="Details" ButtonType="Button" >
                    <ControlStyle BackColor="#FFCC66" />
                    </asp:ButtonField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>

            


        </div>
    </form>
</asp:Content>