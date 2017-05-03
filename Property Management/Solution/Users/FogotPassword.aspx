<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="FogotPassword.aspx.cs" Inherits="Users_FogotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
        <asp:MultiView ID="multiView" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewAskEmail" runat="server">
            <div class="boxed">
                <div class="title">
                    Step 1. Enter Your Username or Email-Id
                </div>
                <div class="content" id="login">
                    <asp:Panel ID="panelUserError" runat="server" Visible="False">
                        <h2>
                            <asp:Label ID="Label3" runat="server" ForeColor="Red" 
                                Text="Oops! Invalid username or emailid, please try again"></asp:Label>
                        </h2>
                    </asp:Panel> <br />
                    <asp:Label ID="Label1" runat="server" Text="User Name or Email Id" 
                        Width="160px"></asp:Label>
                    <asp:TextBox ID="txtUserId" runat="server" CssClass="inputtext"></asp:TextBox> <br />
                    <asp:Button ID="Button1" runat="server" Text="Next" CssClass="inputsubmit" 
                        onclick="Button1_Click"/>
                </div>
            </div>
            </asp:View>
            <asp:View ID="viewSecurityQuestion" runat="server">
            <div class="boxed">
                <div class="title">
                    Step 2. Answer your security Question
                </div>
                <div class="content" id="login">
                    <asp:Panel ID="panelAnswerError" runat="server" Visible="False">
                        <h2>
                            <asp:Label ID="Label2" runat="server" ForeColor="Red" 
                                Text="Alert! Invalid answer, Please try again"></asp:Label>
                        </h2>
                    </asp:Panel> <br />
                    <asp:Label ID="Label4" runat="server" Text="Security Question" 
                        Width="160px"></asp:Label>
                    <asp:DropDownList ID="ddlSecurityQuestion" runat="server" CssClass="inputtext">
                    </asp:DropDownList> <br />
                    <asp:Label ID="Label5" runat="server" Text="Security Answer" 
                        Width="160px"></asp:Label>
                    <asp:TextBox ID="txtSecurityAnswer" runat="server" CssClass="inputtext"></asp:TextBox> <br />
                    <asp:Button ID="Button2" runat="server" Text="Next" CssClass="inputsubmit" 
                        onclick="Button2_Click"/>
                </div>
            </div>
            </asp:View>
            <asp:View ID="viewResetPassword" runat="server">
            <div class="boxed">
            <div class="title">
                Step 3. Enter New Password
            </div>
            <div class="content" id="login">
                <asp:Panel ID="panelPasswordError" runat="server" Visible="False">
                    <h2>
                        <asp:Label ID="Label6" runat="server" ForeColor="Red" 
                            Text="Alert! New Password and Repeat New Password doesn't Match"></asp:Label>
                    </h2>
                </asp:Panel> <br />

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
                Congratulations, Your password has been Reset. Click 
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Users/Login.aspx">here</asp:HyperLink> to Login.
                </div>
            </div>
            </asp:View>
        </asp:MultiView>
</asp:Content>

