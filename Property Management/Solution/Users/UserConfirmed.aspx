<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="UserConfirmed.aspx.cs" Inherits="Agents_Pictures_AgentConfirmed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <div class="boxed">
        <div class="title">
        Successfully Registered
        </div>
        <div class="content">
        <p>Dear <asp:Label ID="lblUsername" runat="server" Text="Label"></asp:Label></p>
        <p>Thank you for registering with <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">PropertyBazar.com</asp:HyperLink>. Your profile is now Active.</p>
            <div class="subtitle">
                Things to do
           </div>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Property/PostPropertyForSale.aspx">Add Property</asp:HyperLink>
            <p>List your property to get buyers and the best price/rent.</p>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Property/SearchProperty.aspx">Search For Properties</asp:HyperLink>
            <p>Search on over 10 criteria including locality, budget, price, size, age of constructions, number of rooms, etc.</p>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Property/ManageProperties.aspx">Manage Properties</asp:HyperLink>
            <p>Ensure that your property listing includes photos. This will let you 7 times higher response.</p>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Property/SearchRequirement.aspx">Search for requirements</asp:HyperLink>
            <p>Property Owners can search for buyers/people looking to rent out properties through their requirements listing posted on the site.</p>
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Property/PostRequirement.aspx">Post a requirement</asp:HyperLink>
            <p>It's free! Get respone to your requirements plus free property Alerts</p>
        </div>
    </div>
</asp:Content>

