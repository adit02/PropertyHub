<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="SearchProperty.aspx.cs" Inherits="Property_SearchProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <div class="boxed">
<div class="title">
Search Residential/Commercial Property in Delhi/NCR
</div>
<div class="content" id="login">
        <asp:Label ID="Label1" runat="server" Text="I Want To" Width="100px"></asp:Label>
        <asp:RadioButton ID="rbnBuy" runat="server" CssClass="inputtext"
           Width="60px" Text="Buy" GroupName="PropertyFor" Checked="True" />
        <asp:RadioButton ID="rbnRent" runat="server" CssClass="inputtext" 
         Width="60px" Text="Rent" GroupName="PropertyFor" /><br />
        <asp:Label ID="Label2" runat="server" Text="Looking For" Width="100px"></asp:Label>
        <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="inputtext" 
                DataSourceID="sqlDataSourcePropertyTypes" DataTextField="Type" 
                DataValueField="Type">
        </asp:DropDownList><br />
        <asp:Label ID="Label3" runat="server" Text="Location" Width="100px"></asp:Label>
        <asp:DropDownList ID="ddlLocation" runat="server" CssClass="inputtext" 
                DataSourceID="sqlDataSourceLocation" DataTextField="City" 
                DataValueField="City">
        </asp:DropDownList><br />
        <asp:Label ID="Label4" runat="server" Text="BedRooms" Width="100px"></asp:Label>
        <asp:DropDownList ID="ddlBedRooms" runat="server" CssClass="inputtext">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Covered / Build Up Area" Width="100px"></asp:Label>
        <asp:TextBox ID="txtCoveredAreaMinLimit" runat="server" CssClass="inputtext"></asp:TextBox>
        <asp:Label ID="Label6" runat="server" Text="To"></asp:Label>
        <asp:TextBox ID="txtCoveredAreaMaxLimit" runat="server" CssClass="inputtext"></asp:TextBox>
        <br />
        <asp:Label ID="Label7" runat="server" Text="Budget" Width="100px"></asp:Label>
            <asp:TextBox ID="txtMinBudget" runat="server" CssClass="inputtext"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" Text="To "></asp:Label>
            <asp:TextBox ID="txtMaxBudget" runat="server" CssClass="inputtext"></asp:TextBox>
            <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Search Property" 
                CssClass="inputsubmit" onclick="btnSubmit_Click"/>
        </div>
    </div>

    <asp:MultiView ID="multiView" runat="server">
        <asp:View ID="viewPropertyFound" runat="server">
                 <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <div class="boxed">
                    </HeaderTemplate>
                    <ItemTemplate>                       
                        <div class="content">
                            <h2 style="color:Red"><%# Eval("propertysubtype") %></h2>
                            <h3>Rs. <%# Eval("totalprice") %></h3>
                            <h3>Covered Area: <%# Eval("coveredarea") %> Sq-ft </h3>
                            <h3>Location: <%# Eval("locality") %> </h3>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Property/PropertyDetails.aspx?propertyid=" + Eval("propertyid") %>'>More Details</asp:HyperLink>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                       </div>                                            
                    </FooterTemplate>
                </asp:Repeater>
        </asp:View>
        <asp:View ID="viewPropertyNotFound" runat="server">
        <div class="boxed">
            <div class="content">
            <h3 style="margin-top:10px">No Property Found for the selected Category.</h3>
            </div>
        </div>
        </asp:View>
    </asp:MultiView>
    
    <asp:SqlDataSource ID="sqlDataSourceLocation" runat="server" 
        ConnectionString="Data Source=localhost;Initial Catalog=PB;Integrated Security=True;" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT DISTINCT [City] FROM [Locations] ORDER BY [City]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDataSourcePropertyTypes" runat="server" 
       ConnectionString="Data Source=localhost;Initial Catalog=PB;Integrated Security=True;" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT DISTINCT [Type] FROM [PropertyTypes]">
    </asp:SqlDataSource>
</asp:Content>

