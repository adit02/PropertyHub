<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="ResponseAddedSuccessfully.aspx.cs" Inherits="Property_ResponseAddedSuccessfully" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
<div class="boxed">
    <div class="title">
        Request Confirmation
    </div>
    <div class="content">
        Thank you for your interest in this property, you will be contacted by the party within 2 days. Click 
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Property/SearchProperty.aspx">here</asp:HyperLink> to search for another property.
    </div>
</div>
</asp:Content>

