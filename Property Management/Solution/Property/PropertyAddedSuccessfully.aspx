<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="PropertyAddedSuccessfully.aspx.cs" Inherits="Property_PropertyAddedSuccessfully" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
<div class="boxed">
    <div class="title">
        Property Confirmation
    </div>
    <div class="content">
        You've successfully added a new property. Click 
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Property/PostPropertyForSale.aspx">here</asp:HyperLink> to add more property.
    </div>
</div>
</asp:Content>

