<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.master" AutoEventWireup="true" CodeFile="BuilderRegistration.aspx.cs" Inherits="Builder_BuilderRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="boxed" id="login">
        <div class="title">
            <asp:Label ID="Label1" runat="server" Text="New User Registeration - Builder ,Agent"></asp:Label>
        </div>
        <div class="content">
            <div class="subtitle">
                <asp:Label ID="Label2" runat="server" Text="About Your Company"></asp:Label>
            </div>
        <asp:Label ID="Label3" runat="server" Text="Builder Name*" Width="140px"></asp:Label>
        <asp:TextBox ID="txtBuilderName" runat="server" CssClass="inputtext"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Builder Name cann't be Empty" ControlToValidate="txtBuilderName" 
                ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> <br />
        <asp:Label ID="Label6" runat="server" Text="Company Name*" Width="140px"></asp:Label>
        <asp:TextBox ID="txtCompanyName" runat="server" CssClass="inputtext"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Company Name Cann't be Empty" ControlToValidate="txtCompanyName" 
                ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
        <asp:Label ID="Label7" runat="server" Text="Company Logo" Width="140px"></asp:Label>
        <asp:FileUpload ID="fileUploadCompanyLogo" runat="server" CssClass="inputtext" 
                style="width:360px"/>
        <asp:Label ID="Label8" runat="server" Text="Upto 1Mb only"></asp:Label><br />
        <asp:Label ID="Label9" runat="server" Text="Operating Since" Width="140px"></asp:Label>
        <asp:DropDownList ID="ddlOperatingSince" runat="server">
            <asp:ListItem>1980</asp:ListItem>
            <asp:ListItem>1981</asp:ListItem>
            <asp:ListItem>1982</asp:ListItem>
            <asp:ListItem>1983</asp:ListItem>
            <asp:ListItem>1984</asp:ListItem>
            <asp:ListItem>1984</asp:ListItem>
            <asp:ListItem>1985</asp:ListItem>
            <asp:ListItem>1986</asp:ListItem>
            <asp:ListItem>1987</asp:ListItem>
            <asp:ListItem>1988</asp:ListItem>
            <asp:ListItem>1989</asp:ListItem>
            <asp:ListItem>1990</asp:ListItem>
            <asp:ListItem>1991</asp:ListItem>
            <asp:ListItem>1992</asp:ListItem>
            <asp:ListItem>1993</asp:ListItem>
            <asp:ListItem>1994</asp:ListItem>
            <asp:ListItem>1995</asp:ListItem>
            <asp:ListItem>1996</asp:ListItem>
            <asp:ListItem>1997</asp:ListItem>
            <asp:ListItem>1998</asp:ListItem>
            <asp:ListItem>1999</asp:ListItem>
            <asp:ListItem>2000</asp:ListItem>
            <asp:ListItem>2001</asp:ListItem>
            <asp:ListItem>2002</asp:ListItem>
            <asp:ListItem>2003</asp:ListItem>
            <asp:ListItem>2004</asp:ListItem>
            <asp:ListItem>2005</asp:ListItem>
            <asp:ListItem>2006</asp:ListItem>
            <asp:ListItem>2007</asp:ListItem>
            <asp:ListItem>2008</asp:ListItem>
            <asp:ListItem>2009</asp:ListItem>
            <asp:ListItem>2010</asp:ListItem>
            <asp:ListItem>2011</asp:ListItem>
            <asp:ListItem>2012</asp:ListItem>
            <asp:ListItem>2013</asp:ListItem>
        </asp:DropDownList>
        <div class="subtitle">        
            <asp:Label ID="Label10" runat="server" Text="About Your Service"></asp:Label>
        </div>
        <asp:Label ID="Label11" runat="server" Text="Company Title*" Width="140px"></asp:Label>
        <asp:TextBox ID="txtCompanyTitle" runat="server" CssClass="inputtext"></asp:TextBox> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtCompanyTitle" ErrorMessage="Company Title is required" 
                ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
        <asp:Label ID="Label12" runat="server" Text="Transaction Type*" Width="140px" 
                Font-Bold="False"></asp:Label>
        <asp:CheckBoxList ID="cbxTransactionTypes" runat="server" CssClass="inputtext" Width="600px" 
            DataSourceID="SqlDataSource1" DataTextField="TxnType" DataValueField="TxnType" 
            RepeatDirection="Horizontal" style="padding-top:10px">
        </asp:CheckBoxList><br />
        <asp:Label ID="Label13" runat="server" Text="Property You Deal In*"></asp:Label>
        <asp:CheckBoxList ID="cbxPropertyTypes" runat="server" Width="600px" style="padding-top:10px"
        DataSourceID="SqlDataSource2" DataTextField="SubType" DataValueField="SubType" 
        RepeatColumns="3" CssClass="inputtext">
        </asp:CheckBoxList>
        <asp:Label ID="Label14" runat="server" Width="140px" style="vertical-align:top" 
        Text="Detail about your Business*"></asp:Label>
        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" 
        CssClass="inputtext" width="400px"></asp:TextBox><br />
        <asp:Label ID="Label15" runat="server" Text="Current Projects *" Width="140px" 
                style="vertical-align:top"></asp:Label>
        <asp:TextBox ID="txtCurrentProjects" runat="server" TextMode="MultiLine" 
                CssClass="inputtext" Width="400px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label19" runat="server" Text="Past Projects*"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPastProjects" runat="server" TextMode="MultiLine" 
                Width="398px"></asp:TextBox>
        <div class="subtitle">
            <asp:Label ID="Label16" runat="server" Text="Operating In"></asp:Label>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:Label ID="Label17" runat="server" Text="City*" Width="140px"></asp:Label>
        <asp:DropDownList ID="ddlCity" runat="server" CssClass="inputtext" 
                DataSourceID="SqlDataSource3" DataTextField="City" DataValueField="City" 
                AutoPostBack="True">
        </asp:DropDownList><br />
        <asp:Label ID="Label18" runat="server" Text="Locality*" Width="140px"></asp:Label>
        <asp:DropDownList ID="ddlLocality" runat="server" CssClass="inputtext" 
                DataSourceID="SqlDataSource4" DataTextField="Locality" 
                DataValueField="Locality"> 
        </asp:DropDownList> <br />
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="inputsubmit" 
                onclick="btnSubmit_Click" />
               
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:csPropertyBazar %>" 
        SelectCommand="SELECT [TxnType] FROM [TransactionTypes]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:csPropertyBazar %>" 
        SelectCommand="SELECT * FROM [PropertyTypes]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:csPropertyBazar %>" 
        SelectCommand="SELECT DISTINCT [City] FROM [Locations] ORDER BY [City]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:csPropertyBazar %>" 
        SelectCommand="SELECT [Locality] FROM [Locations] WHERE ([City] = @City)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCity" Name="City" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>


