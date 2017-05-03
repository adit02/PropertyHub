<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="EditRequirements.aspx.cs" Inherits="Property_EditRequirements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <asp:MultiView ID="multiview" runat="server">
        <asp:View ID="viewUpdateRequirement" runat="server">
            <div class="boxed" id="login">    
                <div class="title">
                    Update Requirement</div>
                <div class="content">
                <asp:Label ID="Label1" runat="server" Text="I Want To" Width="100px"></asp:Label>
                <asp:RadioButton ID="rbnBuy" runat="server" CssClass="inputtext"
                   Width="60px" Text="Buy" GroupName="PropertyFor" Checked="True" />
                <asp:RadioButton ID="rbnRent" runat="server" CssClass="inputtext" 
                 Width="60px" Text="Rent" GroupName="PropertyFor" /><br />
                <asp:Label ID="Label2" runat="server" Text="Looking For" Width="100px"></asp:Label>
                <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="inputtext" 
                        DataSourceID="sqlDataSourcePropertyTypes" DataTextField="SubType" 
                        DataValueField="SubType">
                </asp:DropDownList><br />
                <asp:Label ID="Label3" runat="server" Text="Location" Width="100px"></asp:Label>
                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="inputtext" 
                        DataSourceID="sqlDataSourceLocation" DataTextField="Locality" 
                        DataValueField="Locality">
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
                    <asp:TextBox ID="txtMinBudget" runat="server" CssClass="inputtext" 
                        ></asp:TextBox>
                <asp:Label ID="Label8" runat="server" Text="To "></asp:Label>
                    <asp:TextBox ID="txtMaxBudget" runat="server" CssClass="inputtext"></asp:TextBox>
                    <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Update Your Requirement" 
                        CssClass="inputsubmit" onclick="btnSubmit_Click"/>
                </div>
            </div>
            <asp:SqlDataSource ID="sqlDataSourceLocation" runat="server" 
                 ConnectionString="Data Source=localhost;Initial Catalog=PB;Integrated Security=True;" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT DISTINCT [Locality] FROM [Locations] ORDER BY [Locality]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlDataSourcePropertyTypes" runat="server" 
                 ConnectionString="Data Source=localhost;Initial Catalog=PB;Integrated Security=True;" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT [SubType] FROM [PropertyTypes] ORDER BY [SubType]">
            </asp:SqlDataSource>
                </asp:View>
        <asp:View ID="viewRequirementUpdated" runat="server">
            <div class="boxed">
                <div class="title">
                    Requirement Updated Successfully
                </div>
                <div class="content">
                    Congratulations, you've updated your requirement successfully.
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

