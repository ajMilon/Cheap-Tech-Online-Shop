<%@ Page Title="" Language="C#" MasterPageFile="~/Master2.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CheapShop.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasContent2" runat="server">


    <link href="Style/Registration.css" rel="stylesheet" />
    
    <form id="form1" runat="server">
        <div class="heada">
        <h1> Registration Form</h1>


        </div>

       

        <div style="align-content:center">
            
            <table  class="auto-style1" border="0" style="align-content:center; border:none; ">
                <tr>
                    <td class="auto-style13">Name:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="name_text" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td class="auto-style15">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="name_text" ErrorMessage="Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Age:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="age_text" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="age_text" ErrorMessage="Age is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">Contact No:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="contactNo_text" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="contactNo_text" ErrorMessage="Number is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">Email:</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="email_text" runat="server" Width="180px"></asp:TextBox>
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
                        <asp:TextBox ID="address_text" runat="server" Width="180px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="address_text" ErrorMessage="Adress is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
               
            </table>
            
        </div>
    <div class ="container-fluid">
                <div class="heada">
                    <h3>Authentication details</h3>
                </div>

                <table class="auto-style9">
                    <tr>
                        <td class="auto-style10">User Name</td>
                        <td class="auto-style12">
                <asp:TextBox ID="userName_text" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="userName_text" ErrorMessage="Username is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Password</td>
            <td class="auto-style12">
                <asp:TextBox ID="password_text" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password_text" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Confiirm Password</td>
            <td class="auto-style12">
                <asp:TextBox ID="conPassword_text" runat="server"  Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="conPassword_text" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password_text" ErrorMessage="Both password must be same" ForeColor="Red" ControlToValidate="conPassword_text"></asp:CompareValidator>
            </td>
        </tr>
    </table>
        <div style="align-content:center">
        <input id="Reset1" type="reset" value="Reset" style="margin-left:10px" />
        <asp:Button  ID="submit_button"  runat="server"  Text="Submit" CssClass="alert-danger" Height="30px" Width="80px" Style="margin-top:50px; margin-left:80px" OnClick="submit_button_Click"  />
    
                      

    </div>
        </div>
            </form>
</asp:Content>
