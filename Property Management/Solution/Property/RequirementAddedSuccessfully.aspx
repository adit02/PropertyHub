<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="RequirementAddedSuccessfully.aspx.cs" Inherits="Property_RequirementAddedSuccessfully" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
<div class="boxed">
    <div class="title">
        Requirements
    </div>
    <div class="content">
        Thank you, 
        <asp:Label ID="lblUserName" runat="server"  Font-Bold="True" ></asp:Label> your requirement added successfully. <br />
        Click 
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Property/PostRequirement.aspx">here</asp:HyperLink> to add more requirements.
    </div>
</div>
</asp:Content>

