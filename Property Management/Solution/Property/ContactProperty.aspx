<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="ContactProperty.aspx.cs" Inherits="Property_ContactProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
<div class="boxed">
<div class="title">
 Contact Property
</div>
<div class="content" id="login">
    <asp:Label ID="Label1" runat="server" Text="Name*" Width="100px"></asp:Label>
    <asp:TextBox ID="txtName" runat="server" CssClass="inputtext"></asp:TextBox> <br />
    <asp:Label ID="Label2" runat="server" Text="Email*" Width="100px"></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="inputtext"></asp:TextBox> <br />
    <asp:Label ID="Label3" runat="server" Text="Phone*" Width="100px"></asp:Label>
    <asp:TextBox ID="txtPhone" runat="server" CssClass="inputtext"></asp:TextBox> <br />
    <asp:Label ID="Label4" runat="server" Text="Message" Width="100px" style="vertical-align:top"></asp:Label>
    <asp:TextBox ID="txtMessage" runat="server" CssClass="inputtext" Height="89px" 
        TextMode="MultiLine" Width="220px"></asp:TextBox> <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit Details" 
        CssClass="inputsubmit" onclick="btnSubmit_Click" />
</div>
</div>
</asp:Content>

