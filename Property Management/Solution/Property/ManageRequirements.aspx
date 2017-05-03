<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="ManageRequirements.aspx.cs" Inherits="Property_ManageRequirements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <asp:MultiView ID="multiView" runat="server">
        <asp:View ID="viewRequirementFound" runat="server">
                <div class="boxed">
                    <div class="title">
                        Your Requirements
                    </div>
                    <div class="content">
                            <asp:Repeater ID="Repeater1" runat="server" >
                        <HeaderTemplate>
                            <table border="1px" cellpadding="0" cellspacing="0">
                            <tr class="title">
                                <td style="padding:5px;">Required For</td>
                                <td style="padding:5px;">Type</td>
                                <td style="padding:5px;">Location</td>
                                <td style="padding:5px;">BedRooms</td>
                                <td style="padding:5px;">Min/Max Area</td>
                                <td style="padding:5px;">Min/Max Budget</td>
                                <td style="padding:5px;">Edit/Delete Requirement</td>                                
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>                       
                            <tr>
                            <td style="padding:5px;"> <%# Eval("propertyto")%> </td>
                            <td style="padding:5px;"> <%# Eval("propertytype")%> </td>
                            <td style="padding:5px;"> <%# Eval("locality")%> </td>
                            <td style="padding:5px;"> <%# Eval("bedrooms")%> </td>
                            <td style="padding:5px;"> <%# Eval("minarea")%> Sq ft. - <%# Eval("maxarea") %> Sq ft. </td>
                            <td > Rs. <%# Eval("minbudget")%> - Rs. <%# Eval("maxbudget") %> </td>
                            <td style="padding:5px;"> 
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Property/EditRequirements.aspx?requirementid=" + Eval("requirementid") %>'>Edit</asp:HyperLink> | 
                                <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("Requirementid") %>' onCommand="LinkButton1_Command">Delete</asp:LinkButton> </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    </div>
                </div>
        </asp:View>
        <asp:View ID="viewRequirementNotFound" runat="server">
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

