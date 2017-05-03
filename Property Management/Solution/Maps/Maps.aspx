<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="Maps.aspx.cs" Inherits="Maps_Maps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <div class="boxed">
        <div class="title">
            <asp:Label ID="lblMapName" runat="server"></asp:Label>
        </div>
        <div class="content">
            <asp:Image ID="imgMap" runat="server" Width="740px" />
        </div>
    </div>
</asp:Content>

