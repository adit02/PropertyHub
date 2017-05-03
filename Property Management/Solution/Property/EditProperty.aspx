<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="EditProperty.aspx.cs" Inherits="Property_EditProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <asp:MultiView ID="multiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewPropertyUpdate" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   <div class="boxed" id="login">
    <div class="title">    
        <asp:Label ID="Label1" runat="server" 
            Text="Update Property Details"></asp:Label>
        </div>
        <div class="content">
            <asp:Label ID="Label3" runat="server" Text="Post Property For" Width="140px"></asp:Label>
            <asp:RadioButton ID="rbnPropertyForSale" runat="server" Text="Sale" 
                CssClass="inputtext" GroupName="PropertyFor" Checked="True"/>
            <asp:RadioButton ID="rbnPropertyForRent" runat="server" Text="Rent" 
                CssClass="inputtext" GroupName="PropertyFor"/> <br />
            <asp:UpdatePanel runat="server" ID="updatePanelPropertyType">
                <ContentTemplate>
                    <asp:Label ID="Label4" runat="server" Text="Property Type" Width="140px"></asp:Label>
                    <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="inputtext" 
                        DataSourceID="sqlDataSourcePropertyType" DataTextField="Type" 
                        DataValueField="Type" AutoPostBack="True" 
                        onselectedindexchanged="ddlPropertyType_SelectedIndexChanged">
                    </asp:DropDownList><br />
                    <asp:Label ID="Label2" runat="server" Text="Property Sub Type" Width="140px"></asp:Label>
                    <asp:DropDownList ID="ddlPropertySubType" runat="server"  CssClass="inputtext"
                        DataSourceID="sqlDataSourcePropertySubType" DataTextField="SubType" 
                        DataValueField="SubType">
                    </asp:DropDownList><br /> 
                </ContentTemplate>
            </asp:UpdatePanel>
        <asp:Label ID="Label5" runat="server" Text="Transaction type" Width="140px"></asp:Label>
        <asp:RadioButton ID="rbnTxnTypeNewProperty" runat="server" Text="New Property " 
                CssClass="inputtext" GroupName="TxnType" Checked="True" />
        <asp:RadioButton ID="rbnTxnTypeResale" runat="server" Text="Resale" 
                CssClass="inputtext" GroupName="TxnType" /> <br />

        <asp:UpdatePanel runat="server" ID="updatePanelCity">
            <ContentTemplate>
                <asp:Label ID="Label6" runat="server" Text="City" Width="140px"></asp:Label>
                <asp:DropDownList ID="ddlCity" runat="server" CssClass="inputtext" 
                        AutoPostBack="True" DataSourceID="sqlDataSourceCity" DataTextField="City" 
                        DataValueField="City">
                </asp:DropDownList><br />
                <asp:Label ID="Label7" runat="server" Text="Locality" Width="140px"></asp:Label>
                <asp:DropDownList ID="ddlLocality" runat="server" CssClass="inputtext" 
                        DataSourceID="sqlDataSourceLocality" DataTextField="Locality" 
                        DataValueField="Locality">
                </asp:DropDownList><br />
            </ContentTemplate>
        </asp:UpdatePanel>
            <asp:Label ID="Label8" runat="server" Text="BedRooms" Width="140px"></asp:Label>
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
            </asp:DropDownList><br />
            <asp:Label ID="Label9" runat="server" Text="BathRooms" Width="140px"></asp:Label>
            <asp:DropDownList ID="ddlBathRooms" runat="server" CssClass="inputtext">
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
            </asp:DropDownList><br />
        <asp:Label ID="Label10" runat="server" Text="Furnished" Width="140px"></asp:Label>
        <asp:DropDownList ID="ddlFurnishStatus" runat="server" CssClass="inputtext">
            <asp:ListItem>Furnished</asp:ListItem>
            <asp:ListItem>Un Furnished</asp:ListItem>
            <asp:ListItem>Smei-Furnished</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label11" runat="server" Text="Covered Area" Width="140px"></asp:Label>
        <asp:TextBox ID="txtCoveredArea" runat="server" CssClass="inputtext"></asp:TextBox>
        <br />
        <asp:Label ID="Label12" runat="server" Text="Plot Land Area" Width="140px"></asp:Label>
        <asp:TextBox ID="txtPlotLandArea" runat="server" CssClass="inputtext"></asp:TextBox>
        <br />
        <asp:Label ID="Label13" runat="server" Text="Carpet Area" Width="140px"></asp:Label>
        <asp:TextBox ID="txtCarpetArea" runat="server" CssClass="inputtext"></asp:TextBox>
        <br />
        <asp:Label ID="Label14" runat="server" Text="Total Price" Width="140px"></asp:Label>
        <asp:TextBox ID="txtTotalPrice" runat="server" CssClass="inputtext"></asp:TextBox>
        <asp:Label ID="Label15" runat="server" Text="(in Rs)"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label17" runat="server" Text="Floor No" Width="140px"></asp:Label>
        <asp:DropDownList ID="ddlFloorNo" runat="server" CssClass="inputtext">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label18" runat="server" Text="Total Floors" Width="140px"></asp:Label>
        <asp:TextBox ID="txtTotalFloors" runat="server" CssClass="inputtext"></asp:TextBox>
        <asp:Label ID="Label19" runat="server" Text="Max Allowed Floors(200)"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label20" runat="server" Text="Brief Description" Width="140px" style="vertical-align:top"></asp:Label>
        <asp:TextBox ID="txtDescription" runat="server" Height="80px" TextMode="MultiLine" 
            Width="282px" CssClass="inputtext"></asp:TextBox>
        <br />
        <asp:Label ID="Label21" runat="server" Text="Possesion Status" Width="140px"></asp:Label>
        <asp:RadioButton ID="rbnPossessionStatusUnderConstruction" runat="server" 
                Text="Under Construction" CssClass="inputtext" 
                GroupName="PossessionStatus" />
        <asp:RadioButton ID="rbnPossessionStatusReadyToMove" runat="server" 
                Text="Ready To Move" CssClass="inputtext" GroupName="PossessionStatus" />
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Update Property" 
                CssClass="inputsubmit" onclick="btnSubmit_Click" />
        </div>
    </div>
    <asp:SqlDataSource ID="sqlDataSourcePropertyType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:csPropertyBazar %>" 
        SelectCommand="SELECT DISTINCT [Type] FROM [PropertyTypes]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlDataSourcePropertySubType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:csPropertyBazar %>" 
        
        SelectCommand="SELECT [SubType] FROM [PropertyTypes] WHERE ([Type] = @Type)" 
        ProviderName="System.Data.SqlClient">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlPropertyType" Name="Type" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlDataSourceCity" runat="server" 
        ConnectionString="<%$ ConnectionStrings:csPropertyBazar %>" 
        SelectCommand="SELECT DISTINCT [City] FROM [Locations] ORDER BY [City]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlDataSourceLocality" runat="server" 
        ConnectionString="<%$ ConnectionStrings:csPropertyBazar %>" 
        SelectCommand="SELECT [Locality] FROM [Locations] WHERE ([City] = @City)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCity" Name="City" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

        </asp:View>
        <asp:View ID="viewPropertyUpdated" runat="server">
        <div class="boxed">
            <div class="title">
            <asp:Label ID="Label16" runat="server" 
            Text="Congratulations"></asp:Label>
            </div>
            <div class="content">
                Congratulations, you've updated your property successfully.
            </div>
        </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

