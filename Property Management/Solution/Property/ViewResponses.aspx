<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="ViewResponses.aspx.cs" Inherits="Property_ViewResponses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <asp:MultiView ID="multiView" runat="server">
        <asp:View ID="viewResponseFound" runat="server">
            <div class="boxed">
                <div class="title">
                    List of Persons interested in your property(ies).
                </div>
                <div class="content">
                    <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table border="1px" cellpadding="0" cellspacing="0" >
                        <tr class="title">
                            <td style="padding:5px;">Property ID</td>
                            <td style="padding:5px;">Name</td>
                            <td style="padding:5px;">Phone</td>
                            <td style="padding:5px;">Email</td>
                            <td style="padding:5px;">Date</td>
                            <td style="padding:5px;">Message</td>
                        <tr></tr>
                    </HeaderTemplate>
                    <ItemTemplate>                       
                        <tr>
                        <td style="padding:5px;"> 
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Property/PropertyDetails.aspx?propertyid=" + Eval("propertyid") %>'><%# Eval("PropertyId")%></asp:HyperLink>  </td>
                        <td style="padding:5px;"> <%# Eval("contactname")%> </td>
                        <td style="padding:5px;"> <%# Eval("contactphone")%> </td>
                        <td style="padding:5px;"> <%# Eval("contactemail")%> </td>
                        <td style="padding:5px;"> <%# System.Convert.ToDateTime(Eval("DateofResponse")).ToShortDateString() %> </td>
                        <td style="padding:5px;"> <%# Eval("contactmessage")%> </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                </div>
            </div>
        </asp:View>
        <asp:View ID="viewResponseNotFound" runat="server">
                <div class="boxed">
                    <div class="title">
                        List of Persons interested in your property(ies).
                    </div>                   
                    <div class="content">
                        <h2>Sorry, No response is available.</h2>
                    </div>
                </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

