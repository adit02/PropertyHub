<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="PropertyDetails.aspx.cs" Inherits="Property_PropertyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
<div class="boxed">

    <div class="title">
        <asp:Label ID="lblHeader" runat="server"></asp:Label>
    </div>

    <div class="content">
        <asp:Label ID="lblTotalPrice" runat="server" Font-Bold="True" 
            Font-Size="X-Large" ForeColor="Red" style="margin-bottom:8px"></asp:Label> <br />
        <asp:Label ID="lblpossessionstatus" runat="server" Text="Label" 
            Font-Size="Large" style="margin-bottom:8px"></asp:Label> <br />
        <asp:Label ID="Label107" runat="server" Text="Property Location : "></asp:Label>
        <asp:Label ID="lblPropertyLocation" runat="server" 
            Font-Size="Large" style="margin-bottom:8px"></asp:Label> <br />
            <div style="margin:15px 0px 0px 0px;border:1px solid blue;padding:5px 10px 5px 10px">
                <asp:Label ID="Label2" runat="server" Text="Property Details" Font-Bold="True" 
                    Font-Size="18pt" Height="40"></asp:Label> <br />
                <asp:Label ID="Label3" runat="server" Text="BedRooms (s) : "></asp:Label>
                <asp:Label ID="lblBedrooms" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label9" runat="server" Text="BathRooms(s) : "></asp:Label>
                <asp:Label ID="lblBathrooms" runat="server" Text="Label"></asp:Label> 
                <br />
                <asp:Label ID="label100" runat="server" Text="Covered Area : "></asp:Label>
                <asp:Label ID="lblcoveredarea" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label101" runat="server" Text="Furnished : "></asp:Label>
                <asp:Label ID="lblfurnished" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label103" runat="server" Text="Floor No : "></asp:Label>
                <asp:Label ID="lblfloorno" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label105" runat="server" Text="Total Floors : "></asp:Label>
                <asp:Label ID="lbltotalfloors" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label106" runat="server" Text="Transaction Type : "></asp:Label>
                <asp:Label ID="lbltransactiontype" runat="server" Text="Label"></asp:Label>
            </div>
    </div>
    <div class="boxed">
        <div class="title">
            <asp:Label ID="lblProp" runat="server" ></asp:Label>
        </div>
        <div class="content" id="login">
            <asp:Label ID="lblpropname" runat="server"  Font-Size="X-Large"></asp:Label> 
            <br />
            <asp:Label ID="lblname" runat="server"></asp:Label>
            <br />
            <asp:HyperLink ID="lnProfilePage" runat="server">HyperLink</asp:HyperLink>
            <br />
            <asp:Label ID="lbladdress" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblphone" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblemail" runat="server"></asp:Label>
            <br />
            <asp:Button ID="btnContact" runat="server" onclick="postContactProperty" 
                Text="Contact" CssClass="inputsubmit" />
        </div>
    </div>
</div>
</asp:Content>

