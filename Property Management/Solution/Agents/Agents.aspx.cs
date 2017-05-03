using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Agents_Agents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string dealingin = ddlDealingIn.SelectedValue;
        string propertyhandled = ddlPropertiesHandled.SelectedValue;
        string city = ddlCity.SelectedValue;
        string locality = ddlLocality.SelectedValue;

        string navigateUrl = "~/Agents/AgentSearchResult.aspx?dealingin=" + dealingin + "&propertyhandled=" + propertyhandled + "&city=" + city + "&location=" + locality;
        Response.Redirect(navigateUrl);
    }
}