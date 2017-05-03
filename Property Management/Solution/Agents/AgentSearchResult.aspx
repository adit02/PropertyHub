<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="AgentSearchResult.aspx.cs" Inherits="Agents_AgentSearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <div class="boxed">
        <div class="title">
        Agents in 
            <asp:Label ID="lblLocation" runat="server" Text="Label"></asp:Label>
        </div>

        <div class="content">
            <asp:MultiView ID="multiview" runat="server" ActiveViewIndex="1">
                <asp:View ID="viewRecordFound" runat="server">
                    <asp:Repeater ID="Repeater1" runat="server">
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
                </asp:View>
                <asp:View ID="viewRecordNotFound" runat="server">
                    No record found for given Criteria.
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>

