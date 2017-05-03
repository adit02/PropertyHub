<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="ManageProperties.aspx.cs" Inherits="Property_ManageProperties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <asp:MultiView ID="multiView" runat="server">
        <asp:View ID="viewPropertyFound" runat="server">
                <div class="boxed">
                    <div class="title">
                        Properties Listed by You
                    </div>
                    <div class="content">
                            <asp:Repeater ID="Repeater1" runat="server" >
                        <HeaderTemplate>
                            <table border="1px" cellpadding="0" cellspacing="0">
                            <tr class="title">
                                <td style="padding:5px;">Property Id</td>
                                <td style="padding:5px;">Posted For</td>
                                <td style="padding:5px;">Property Type</td>
                                <td style="padding:5px;">Property SubType</td>
                                <td style="padding:5px;">Locatios</td>
                                <td style="padding:5px;">BedRooms</td>
                                <td style="padding:5px;">Covered Area</td>
                                <td style="padding:5px;">Total Price</td>
                                <td style="padding:5px;">Edit/Delete Property</td>                                
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>                       
                            <tr>
                            <td style="padding:5px;"> <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Property/PropertyDetails.aspx?propertyid=" + Eval("propertyid") %>'> <%# Eval("propertyid")%> </asp:HyperLink> </td>
                            <td style="padding:5px;"> <%# Eval("postedfor")%> </td>
                            <td style="padding:5px;"> <%# Eval("propertytype")%> </td>
                            <td style="padding:5px;"> <%# Eval("propertysubtype")%> </td>
                            <td style="padding:5px;"> <%# Eval("locality")%> </td>
                            <td style="padding:5px;"> <%# Eval("bedrooms")%> </td>
                            <td style="padding:5px;"> <%# Eval("coveredarea")%> Sq ft. </td>
                            <td > Rs. <%# Eval("totalprice")%> </td>
                            <td style="padding:5px;"> 
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Property/EditProperty.aspx?propertyid=" + Eval("propertyid") %>'>Edit</asp:HyperLink> | 
                                <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("propertyid") %>' onCommand="LinkButton1_Command">Delete</asp:LinkButton> </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    </div>
                </div>
        </asp:View>
        <asp:View ID="viewPropertyNotFound" runat="server">
                <div class="boxed">
                    <div class="title">
                        Your Requirements
                    </div>                   
                    <div class="content">
                        <h2>Sorry, No requirement is added by you.</h2>
                    </div>
                </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

