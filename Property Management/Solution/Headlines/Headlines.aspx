<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Headlines.aspx.cs" Inherits="Headlines_Headlines" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/StyleSheet.css" rel="Stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <center>

    <!-- Top Region -->
    
    <div id="logo">
        <div id="logotext">
        <h1>Property Bazar</h1>
        <h2>Buy Property | Sell Property | Rent Property</h2>
        </div>
        <div id="login">
            Real Estate News & Updates
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Home Page</asp:HyperLink>
        </div>
    </div>

    <!-- End of Top Region -->

    <!-- Menu -->
    
    <div id="menu">
        <asp:Menu ID="Menu2" runat="server" 
            DynamicHorizontalOffset="2" Height="50px" 
            Orientation="Horizontal" RenderingMode="Table" 
            Width="1200px" ForeColor="White"
            >
            <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#E3EAEB" />
            <DynamicSelectedStyle BackColor="#1C5E55" />
            <Items>
                <asp:MenuItem Text="All India" Value="India" NavigateUrl="#"></asp:MenuItem>
                <asp:MenuItem Text="Delhi/NCR" Value="Delhi"></asp:MenuItem>
                <asp:MenuItem Text="Bengaluru" Value="Bengaluru" NavigateUrl="#"></asp:MenuItem>
                <asp:MenuItem Text="Hyderabad" Value="Hyderabad" NavigateUrl="#"></asp:MenuItem>
                <asp:MenuItem Text="Ahmedabad" Value="Ahmedabad" NavigateUrl="#"></asp:MenuItem>
                <asp:MenuItem Text="Goa" Value="Goa" NavigateUrl="#"></asp:MenuItem>
                <asp:MenuItem Text="Chennai" Value="Chennai" NavigateUrl="#"></asp:MenuItem>
                <asp:MenuItem Text="Other Cities" Value="Other Cities" NavigateUrl="#"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#666666" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#1C5E55" />
        </asp:Menu>
    </div>

    <!-- End of Main Region -->

    <!-- Content Region -->

    <div id="Content-Wrapper">      
        
        <div id="HeadLinePost" class="post">
            <div class="info">
                <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
            </div>

            <div class="headline">
                <asp:Label ID="lblHeadLine" runat="server" Text=""></asp:Label>
            </div>

            <div class="description">
                <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
            </div>
        </div>                    
    </div>
    <!-- End of Content Region -->

    <!-- Footer -->
    <div id="footer">
    Developed by Girish Kumar Attri
    </div>
    <!-- End of Footer -->

    </center>
    </form>
</body>
</html>
