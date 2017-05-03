<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/home.master" AutoEventWireup="true" CodeFile="Buyyertips.aspx.cs" Inherits="Buyyertips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <div class="boxed">
        <div class="title">
            <asp:LinkButton ID="LinkButton18" runat="server" onclick="LinkButton18_Click" Width="100px" style="text-align:left">&lt;&lt; Previous Tip</asp:LinkButton>
            <asp:Label ID="lblHead" runat="server" Width="550px" style="text-align:center"></asp:Label>    
            <asp:LinkButton ID="LinkButton19" runat="server" onclick="LinkButton19_Click" Width="100px" style="text-align:right">Next Tip &gt;&gt;</asp:LinkButton>
        </div>
        <div class="content">
            <asp:Label ID="lblText" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
</asp:Content>

