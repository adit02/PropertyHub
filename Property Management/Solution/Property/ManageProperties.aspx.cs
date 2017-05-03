using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Property_ManageProperties : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userid = Session["username"].ToString();

        SqlParameter prmUserId = new SqlParameter("@userid", SqlDbType.NVarChar);
        prmUserId.Value = userid.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM [Property] WHERE ([userid] = @userid) ORDER BY [propertyid]";
        cmd.Connection = con;

        cmd.Parameters.Add(prmUserId);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Repeater1.DataSource = dr;
            Repeater1.DataBind();
            multiView.SetActiveView(viewPropertyFound);
        }
        else
        {
            multiView.SetActiveView(viewPropertyNotFound);
        }
        con.Close();
    }
    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        int propertyid = int.Parse(e.CommandArgument.ToString());
        string userid = Session["username"].ToString();

        SqlParameter prmPropertyId = new SqlParameter("@propertyid", SqlDbType.Int);
        prmPropertyId.Value = propertyid;


        SqlParameter prmUserId = new SqlParameter("@userid", SqlDbType.NVarChar);
        prmUserId.Value = userid.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "delete from Property where propertyid=@propertyid";
        cmd.Connection = con;
        cmd.Parameters.Add(prmPropertyId);
        cmd.Parameters.Add(prmUserId);

        con.Open();
        int result = cmd.ExecuteNonQuery();

        if (result > 0)
        {
            cmd.CommandText = "SELECT * FROM [Property] WHERE ([userid] = @userid) ORDER BY [propertyid]";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Repeater1.DataSource = dr;
                Repeater1.DataBind();
                multiView.SetActiveView(viewPropertyFound);
            }
            else
            {
                multiView.SetActiveView(viewPropertyNotFound);
            }
        }
        con.Close();
    }
}