<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="ContactBuilders.aspx.cs" Inherits="Agents_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="boxed">    
        <div class="title">
            <asp:Label ID="Label1" runat="server" Text="Builder Information"></asp:Label>
        </div>
        <div class="content">
            <div style="border-bottom:1px solid black;float:left;width:740px;margin-bottom:10px;padding-bottom:15px">
                <asp:Image ID="imgCompanylogo" runat="server" Width="100px" Height="100px" style="float:left;margin-top:5px" />
                <div style="vertical-align:top;margin-left:5px;margin-bottom:5px;float:left">
                    <asp:Label ID="lblCompanyName" runat="server"                         
                        Font-Size="X-Large"></asp:Label>
                    <p><asp:Label ID="lblTitle" runat="server" ></asp:Label></p>
                    <p>
                        <asp:Label ID="Label11" runat="server" Text="Contact No(s) : "></asp:Label>
                        <asp:Label ID="lblPhoneNo" runat="server"></asp:Label><br />                                        
                        <asp:Label ID="Label12" runat="server" Text="Address : "></asp:Label>
                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    </p>
                </div>
            </div>
                       
            <div style="border-bottom:1px solid black;float:left;width:740px;margin-bottom:10px;padding-bottom:15px">
            <asp:Label ID="Label4" runat="server" Text="Operating Since : " 
                Font-Bold="True"></asp:Label>
            <asp:Label ID="lbloperatingsince" runat="server" Text="Label" Font-Bold="True"></asp:Label>
            </div>

            <div style="border-bottom:1px solid black;float:left;width:740px;margin-bottom:10px;padding-bottom:15px">
            <asp:Label ID="Label5" runat="server" Text="About Us:" Font-Bold="True"></asp:Label>
            <asp:Label ID="lblAboutUs" runat="server" Text="Label"></asp:Label>
            </div>

            <div style="border-bottom:1px solid black;float:left;width:740px;margin-bottom:10px;padding-bottom:15px">            
            <asp:Label ID="Label6" runat="server" Text="Location We Deal In : " Font-Bold="True"></asp:Label>
            <asp:Label ID="lblLocation" runat="server" Text="Label"></asp:Label>            
            </div>

            <div style="border-bottom:1px solid black;float:left;width:740px;margin-bottom:10px;padding-bottom:15px">            
            <asp:Label ID="Label2" runat="server" Text="Past Projects : " Font-Bold="True"></asp:Label>
            <asp:Label ID="lblPastProjects" runat="server" Text="Label"></asp:Label>            
            </div>

            <div style="border-bottom:1px solid black;float:left;width:740px;margin-bottom:10px;padding-bottom:15px">            
            <asp:Label ID="Label3" runat="server" Text="Current Projects : " Font-Bold="True"></asp:Label>
            <asp:Label ID="lblCurrentProjects" runat="server" Text="Label"></asp:Label>            
            </div>


            <asp:Label ID="Label7" runat="server" Text="Properties We Deal In" Font-Bold="True"></asp:Label>
            <br />
                <asp:BulletedList ID="blstPropertyResidential" runat="server" style="margin-left:50px">
                </asp:BulletedList>
        </div>
    </div>
    
    <div class="boxed">
        <div class="title">
            <asp:Label ID="Label10" runat="server" Text="Browse Properties Posted by "></asp:Label>
            <asp:Label ID="lblCompanyName1" runat="server"></asp:Label>
        </div>
        <div class="content">        
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" Width="100px" 
                onclick="LinkButton1_Click" >
            Residential</asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server" Width="100px" 
                    onclick="LinkButton2_Click" >
            Commercial </asp:LinkButton> <br />
                <asp:MultiView ID="multiView" runat="server" ActiveViewIndex="0">
                    <asp:View ID="viewPropertyFound" runat="server">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <table width="100%">
                                <tr>
                            </HeaderTemplate>
                            <ItemTemplate>                       
                                <td class="PropertyTab">
                                    <h2 style="color:Red">For <%# Eval("postedfor") %></h2>
                                    <h3><%# Eval("propertysubtype") %></h3>
                                    <h3>Rs. <%# Eval("totalprice") %></h3>
                                    <h3>Covered Area: <%# Eval("coveredarea") %> Sq-ft </h3>
                                    <h3>Location: <%# Eval("locality") %> </h3>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Property/PropertyDetails.aspx?propertyid=" + Eval("propertyid") %>'>More Details</asp:HyperLink>
                                </td>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tr>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:View>
                    <asp:View ID="viewPropertyNotFound" runat="server">
                    <h3 style="margin-top:10px">No Property Found for the selected Category.</h3>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>

