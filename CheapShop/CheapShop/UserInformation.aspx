<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="UserInformation.aspx.cs" Inherits="CheapShop.UserInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">

    
    <link href="Style/Registration.css" rel="stylesheet" />

     <form id="formInfo" runat="server">
        <div class="heada">
        <h1> User Information</h1>


        </div>

       

        <div style="align-content:center">
            
            <table  class="auto-style1" border="0" style="align-content:center; border:none; ">
                <tr>
                    <td class="auto-style13">Name:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="name_text" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="auto-style15">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="name_text" ErrorMessage="Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Age:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="age_text" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="age_text" ErrorMessage="Age is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">Contact No:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="contactNo_text" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="contactNo_text" ErrorMessage="Number is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">Email:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="email_text" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email_text" ErrorMessage="Enter valid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="email_text" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">Address:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="address_text" runat="server" Width="183px" Height="49px" OnTextChanged="address_text_TextChanged" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="address_text" ErrorMessage="Adress is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
               
            </table>
            
        </div>
    <div class ="container-fluid">
                <div class="heada">
                   
                </div>

                
        <div style="align-content:center">

             <asp:Button ID="logOutButton" runat="server" Text="Log Out" OnClick="logOutButton_Click" />
    
                      

    </div>
        </div>
            </form>
</asp:Content>
