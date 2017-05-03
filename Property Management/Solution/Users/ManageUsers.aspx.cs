using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Users_ManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String userid = Session["username"].ToString();

        SqlParameter prmUserId = new SqlParameter("@userid", SqlDbType.NVarChar, 50);
        prmUserId.Value = userid.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select usertype from users where userid=@userid";
        cmd.Connection = con;
        cmd.Parameters.Add(prmUserId);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            dr.Read();
            if (dr["usertype"].ToString() == "0")
            {
                Response.Redirect("~/Owner/EditOwner.aspx");
            }
            else if (dr["usertype"].ToString() == "1")
            {
                Response.Redirect("~/Agents/EditAgent.aspx");
            }
            else
            {
                Response.Redirect("~/Builder/EditBuilder.aspx");
            }
        }
    }
}