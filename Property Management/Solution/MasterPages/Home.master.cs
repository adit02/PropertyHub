using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

public partial class masterpages_home : System.Web.UI.MasterPage
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logged"] != null)
        {
            lblUser.Text = Session["username"].ToString();
            loginMultiView.SetActiveView(viewLogout);
            menuSiteMap.SiteMapProvider = "Member";
        }
        else
        {
            loginMultiView.SetActiveView(viewLogin);
            menuSiteMap.SiteMapProvider = "NonMember";
        }

        LoadHeadLines();
    }
    
    protected void lbnLogout_Click(object sender, EventArgs e)
    {

        Session["logged"] = null;
        Response.Redirect("~/Home.aspx");
    }

    private void LoadHeadLines()
    {
        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;

        con = new SqlConnection(conString);
        cmd = new SqlCommand();
        cmd.Connection = con;

        String sqlCommand = "select postid,headline from headlines " +
                            "Order by postid DESC";

        cmd.CommandText = sqlCommand;

        con.Open();
        dr = cmd.ExecuteReader();

        dr.Read();
        Post1.Text = dr["headline"].ToString();
        Post1.NavigateUrl = "~/Headlines/Headlines.aspx?ArticleId=" + dr["postid"].ToString();

        dr.Read();
        Post2.Text = dr["headline"].ToString();
        Post2.NavigateUrl = "~/Headlines/Headlines.aspx?ArticleId=" + dr["postid"].ToString();

        
        dr.Read();
        Post3.Text = dr["headline"].ToString();
        Post3.NavigateUrl = "~/Headlines/Headlines.aspx?ArticleId=" + dr["postid"].ToString();

        dr.Read();
        Post4.Text = dr["headline"].ToString();
        Post4.NavigateUrl = "~/Headlines/Headlines.aspx?ArticleId=" + dr["postid"].ToString();

        dr.Read();
        Post5.Text = dr["headline"].ToString();
        Post5.NavigateUrl = "~/Headlines/Headlines.aspx?ArticleId=" + dr["postid"].ToString();

        dr.Read();
        Post6.Text = dr["headline"].ToString();
        Post6.NavigateUrl = "~/Headlines/Headlines.aspx?ArticleId=" + dr["postid"].ToString();

        dr.Read();
        Post7.Text = dr["headline"].ToString();
        Post7.NavigateUrl = "~/Headlines/Headlines.aspx?ArticleId=" + dr["postid"].ToString();        
        
        con.Close();
    }
}
