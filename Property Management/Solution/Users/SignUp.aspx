<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/home.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <div id="login" class="boxed">
        <div class="title">
            <asp:Label ID="Label8" runat="server" 
                Text="Create A New Account"></asp:Label>
        </div>
        <div class="content">
            <div class="subtitle">
                <asp:Label ID="Label1" runat="server" Text="User Details"></asp:Label>
            </div>
            <asp:Label ID="Label2" runat="server" Text="User Type" Width="160px"></asp:Label>
            <asp:DropDownList ID="ddlAccountType" runat="server" >
                <asp:ListItem>Owner</asp:ListItem>
                <asp:ListItem>Agent</asp:ListItem>
                <asp:ListItem>Builder</asp:ListItem>
            </asp:DropDownList> <br />
            <asp:Label ID="Label9" runat="server" Text="User ID*" Width="160px"></asp:Label>
            <asp:TextBox ID="txtUserName" runat="server" CssClass="inputtext"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtUserName" ErrorMessage="User Id is required" 
                Font-Bold="False" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label10" runat="server" Text="New Password" Width="160px"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="inputtext" 
                TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtPassword" ErrorMessage="Password cannot Empty" 
                Font-Bold="False" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label11" runat="server" Text="Confirm Password" Width="160px"></asp:Label>
            <asp:TextBox ID="txtRepeatPassword" runat="server" CssClass="inputtext" 
                TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtPassword" ControlToValidate="txtRepeatPassword" 
                ErrorMessage="Password Didn't Match" Font-Bold="False" Font-Size="Large" 
                ForeColor="Red"></asp:CompareValidator>
            <br />
            <asp:Label ID="Label12" runat="server" Text="Security Question" Width="160px"></asp:Label>
            <asp:DropDownList ID="ddlSecurityQuestion" runat="server">  
                <asp:ListItem>What was your favourite Hobby?</asp:ListItem>
                <asp:ListItem>What is your Mother Name?</asp:ListItem>
                <asp:ListItem>What was your Last Destination?</asp:ListItem>
            </asp:DropDownList> <br />
            <asp:Label ID="Label13" runat="server" Text="Security Answer" Width="160px"></asp:Label>
            <asp:TextBox ID="txtSecurityAnswer" runat="server" CssClass="inputtext"></asp:TextBox> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtSecurityAnswer" ErrorMessage="Field Can't be blank" 
                Font-Bold="False" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label14" runat="server" Text="Email Account" Width="160px"></asp:Label>
            <asp:TextBox ID="txtEmailAccount" runat="server" CssClass="inputtext"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtEmailAccount" ErrorMessage="Email ID Required " 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtEmailAccount" ErrorMessage="Invalid Email Id" 
                Font-Bold="False" Font-Size="Large" ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
        <div class="subtitle">
            <asp:Label ID="Label15" runat="server" 
                Text="Personal Information"></asp:Label>
        </div>
            <asp:Label ID="Label16" runat="server" Text="First Name" Width="160px"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="inputtext"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtFirstName" ErrorMessage="Name is Required" 
                Font-Bold="False" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label17" runat="server" Text="Last Name" Width="160px"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" CssClass="inputtext"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtLastName" ErrorMessage="Last Name is Required" 
                Font-Bold="False" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Phone" Width="160px"></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="inputtext"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="txtPhone" ErrorMessage="Phone No is Required " 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="txtPhone" ErrorMessage="Invalid Phone No" Font-Bold="False" 
                ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="Label20" runat="server" Text="Address" Width="160px"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="inputtext"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtAddress" ErrorMessage="Address Can't be blank" 
                Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label19" runat="server" Text="City" Width="160px"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="inputtext"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtCity" ErrorMessage="field cannot be blank" 
                Font-Bold="False" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
            onclick="btnSubmit_Click" CssClass="inputsubmit" />
        </div>
    </div>
</asp:Content>

