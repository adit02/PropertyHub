<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Users_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <div id="login" class="boxed">
        <div class="title">Property Bazar</div>
        <div class="content">
            <fieldset>
                <legend>Sign-In</legend>
                <asp:Panel ID="panelLoginError" runat="server">
                    <h2><asp:Label ID="Label3" runat="server" 
                            Text="Oops! something went wrong, please try again" ForeColor="Red"></asp:Label></h2>
                </asp:Panel>
                <h2><asp:Label ID="Label4" runat="server" Text="User Type"></asp:Label></h2>
                <asp:DropDownList ID="ddlUserType" runat="server">
                    <asp:ListItem>Owner</asp:ListItem>
                    <asp:ListItem>Agent</asp:ListItem>
                    <asp:ListItem>Builder</asp:ListItem>
                </asp:DropDownList> <br />

                <h2><asp:Label ID="Label1" runat="server" Text="User ID"></asp:Label></h2>
                <asp:TextBox ID="txtUserID" runat="server" CssClass="inputtext"></asp:TextBox>
                <h2><asp:Label ID="Label2" runat="server" Text="Passoword"></asp:Label></h2>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="inputtext"
                    TextMode="Password"></asp:TextBox> <br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="inputsubmit" 
                    onclick="btnLogin_Click"/>
                <p>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl="~/Users/FogotPassword.aspx">Forgot Password?</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Users/SignUp.aspx">Not have an account? Sign up Here</asp:HyperLink>
                </p>
            </fieldset>
        </div>
    </div>
</asp:Content>

