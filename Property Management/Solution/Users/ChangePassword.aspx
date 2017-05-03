<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Users_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <asp:MultiView ID="multiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewChangePassword" runat="server">
                <div class="boxed">
                        <div class="title">
                            Enter New Password
                        </div>
                        <div class="content" id="login">
                            <asp:Panel ID="panelPasswordError" runat="server" Visible="False">
                                <h2>
                                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                                </h2>
                            </asp:Panel> <br />
                            <asp:Label ID="Label1" runat="server" Text="Current Password" 
                                Width="160px"></asp:Label>
                            <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="inputtext" 
                                TextMode="Password"></asp:TextBox> <br />               
                            <asp:Label ID="Label8" runat="server" Text="New Password" 
                                Width="160px"></asp:Label>
                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="inputtext" 
                                TextMode="Password"></asp:TextBox> <br />
                            <asp:Label ID="Label7" runat="server" Text="Retype New Password" 
                                Width="160px"></asp:Label>
                            <asp:TextBox ID="txtRepeatNewPassword" runat="server" CssClass="inputtext" 
                                TextMode="Password"></asp:TextBox> <br />
                            <asp:Button ID="Button3" runat="server" Text="Reset Password" CssClass="inputsubmit" 
                                onclick="Button3_Click"/>
                        </div>
                </div>
        </asp:View>
        <asp:View ID="viewPasswordSet" runat="server">
            <div class="boxed">
                <div class="title">
                Password Reset
                </div>
                <div class="content">
                    Congratulations, Your password has been Reset.</div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

