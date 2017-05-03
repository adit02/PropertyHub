<%@ Page Title="Edit Owner Details" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="EditOwner.aspx.cs" Inherits="Owner_EditOwner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <asp:MultiView ID="multiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewUserUpdate" runat="server">
            <div class="boxed" id="login">
            <div class="title">
            <asp:Label ID="Label15" runat="server" 
                Text="Update Personal Information"></asp:Label>
            </div>
            <div class="content">
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
            <asp:Button ID="btnSubmit" runat="server" Text="Update Personal Details" 
            onclick="btnSubmit_Click" CssClass="inputsubmit" />
            </div>
        </div>
        </asp:View>
        <asp:View ID="viewUserUpdated" runat="server">
                    <div class="boxed">
                <div class="title">
                    Update Builder Details
                </div>
                <div class="content">
                    <h2>Congratulations, you've updated your details successfully.</h2>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

