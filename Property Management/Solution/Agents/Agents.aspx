<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="Agents.aspx.cs" Inherits="Agents_Agents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="boxed">
        <div class="title">
            Find Agent
        </div>
        <div class="content" id="login">
            <asp:Label ID="Label1" runat="server" Text="Dealing In" width="100px"></asp:Label>
            <asp:DropDownList ID="ddlDealingIn" runat="server" CssClass="inputtext" 
                style="margin-right:30px" DataSourceID="sdsDealingIn" 
                DataTextField="TxnType" DataValueField="TxnType">
            </asp:DropDownList>
            <asp:Label ID="Label2" runat="server" Text="Properties Handled" Width="140px"></asp:Label>
            <asp:DropDownList ID="ddlPropertiesHandled" runat="server" CssClass="inputtext" 
                DataSourceID="sdsPropertiesHandled" DataTextField="SubType" 
                DataValueField="SubType">
            </asp:DropDownList>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label3" runat="server" Text="City" Width="100px"></asp:Label>
                    <asp:DropDownList ID="ddlCity" runat="server" CssClass="inputtext" 
                        style="margin-right:30px" AutoPostBack="True" DataSourceID="sdsCity" 
                        DataTextField="City" DataValueField="City">
                    </asp:DropDownList>
                    <asp:Label ID="Label4" runat="server" Text="Locality" Width="140px"></asp:Label>
                    <asp:DropDownList ID="ddlLocality" runat="server" CssClass="inputtext" 
                        DataSourceID="sdsLocality" DataTextField="Locality" DataValueField="Locality">
                    </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="inputsubmit" 
                onclick="btnSearch_Click"/>
        </div>
    </div>
    <asp:SqlDataSource ID="sdsDealingIn" runat="server" 
       ConnectionString="Data Source=localhost;Initial Catalog=PB;Integrated Security=True;" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT * FROM [TransactionTypes] ORDER BY [TxnType]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsPropertiesHandled" runat="server" 
        ConnectionString="Data Source=localhost;Initial Catalog=PB;Integrated Security=True;" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT [SubType] FROM [PropertyTypes]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsCity" runat="server" 
        ConnectionString="Data Source=localhost;Initial Catalog=PB;Integrated Security=True;" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT DISTINCT [City] FROM [Locations] ORDER BY [City]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsLocality" runat="server" 
        ConnectionString="Data Source=localhost;Initial Catalog=PB;Integrated Security=True;" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT [Locality] FROM [Locations] WHERE ([City] = @City)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCity" Name="City" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="boxed">
        <div class="title">
        Agent in New Delhi
        </div>
        <div class="content">
            <asp:SqlDataSource ID="sdsAgents" runat="server" 
                ConnectionString="<%$ ConnectionStrings:csPropertyBazar %>" 
                SelectCommand="SELECT * FROM [Agents]"></asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsAgents">
                <HeaderTemplate>
                    <table width="100%">
                    <tr>
                </HeaderTemplate>
                <ItemTemplate>                       
                    <td class="AgentTab">
                        <h2><%# Eval("Locality") %></h2>
                        <asp:Image ID="Image1" runat="server" style="float:left"
                            ImageUrl='<%# "Handler.ashx?ID=" + Eval("Userid")%>'/>
                        <h3><%# Eval("CompanyName") %></h3>
                        <p><%# Eval("Title") %></p>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Agents/ContactAgents.aspx?agentid=" + Eval("Userid") %>'>Contact Now</asp:HyperLink>
                    </td>
                </ItemTemplate>
                <FooterTemplate>
                    </tr>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>

