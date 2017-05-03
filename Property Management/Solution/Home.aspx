<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/home.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Homeclick" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <div class="boxed">
        <div class="title">
            <asp:HyperLink ID="HyperLink1" runat="server" >Residential</asp:HyperLink>            
        </div>
        <div class="content">
            <Marquee>
            <asp:Image ID="Image1" runat="server" Height="150px" 
                ImageUrl="~/pictures/pic1.JPG" Width="200px" />
            <asp:Image ID="Image2" runat="server" Height="150px" 
                ImageUrl="~/pictures/pic2.jpg" Width="200px" />       
            <asp:Image ID="Image3" runat="server" Height="150px" 
                ImageUrl="~/pictures/pic3.JPG" Width="200px" />       
            <asp:Image ID="Image4" runat="server" Height="150px" 
                ImageUrl="~/pictures/pic4.jpg" Width="200px" />        
            <asp:Image ID="Image5" runat="server" Height="150px" 
                ImageUrl="~/pictures/pic5.jpg" Width="200px" />
            </Marquee>
        </div>
        <div class="title">
                <asp:HyperLink ID="HyperLink2" runat="server">Commercial</asp:HyperLink>
        </div>
        <div class="content">
            <Marquee>
            <asp:Image ID="Image6" runat="server" Height="150px" 
                ImageUrl="~/pictures/cm1.gif" Width="200px" />
            <asp:Image ID="Image7" runat="server" Height="150px" 
                ImageUrl="~/pictures/cm2.jpg" Width="200px" />
            <asp:Image ID="Image8" runat="server" Height="150px" 
                ImageUrl="~/pictures/cm3.jpg" Width="200px" />
            <asp:Image ID="Image9" runat="server" Height="150px" 
                ImageUrl="~/pictures/cm4.jpg" Width="200px" />
            <asp:Image ID="Image10" runat="server" Height="150px" 
                ImageUrl="~/pictures/cm5.jpg" Width="200px" />
            </Marquee>
        </div>
    </div>
</asp:Content>

