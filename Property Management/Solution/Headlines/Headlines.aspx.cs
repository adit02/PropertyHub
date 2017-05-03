using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;

public partial class Headlines_Headlines : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        /*
        if (!Page.IsCallback)
        {
            Response.Redirect("~/Home.aspx");
        }
         */

        int articleId = int.Parse(Request.QueryString["ArticleId"].ToString());

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;

        con = new SqlConnection(conString);
        cmd = new SqlCommand();
        cmd.Connection = con;

        String sqlCommand = "select * from HeadLines "+
                            "where postid="+articleId.ToString() + 
                            "Order By postid DESC";

        cmd.CommandText = sqlCommand;

        con.Open();
        dr = cmd.ExecuteReader();

        dr.Read();

        String postedon = Convert.ToDateTime(dr["postedon"].ToString()).ToShortDateString();

        String info = "Posted By: " + dr["postedby"].ToString() + " Posted On: " +
                    postedon + " Posted In: " +
                    dr["postedin"].ToString() + " Tagged: " +
                    dr["tag"].ToString();


        lblInfo.Text = info;
        lblHeadLine.Text = dr["headline"].ToString();
        lblDescription.Text = dr["description"].ToString();

        con.Close();
        return;

    }
}