using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Property_ViewResponses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userid = Session["username"].ToString();

        SqlParameter prmUserId = new SqlParameter("@userid", SqlDbType.NVarChar);
        prmUserId.Value = userid.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT Response.PropertyId, Response.DateofResponse, Response.contactname, Response.contactemail, Response.contactphone, Response.contactmessage FROM Property INNER JOIN Response ON Property.propertyid = Response.PropertyId WHERE (Property.userid = @userid)";
        cmd.Connection = con;

        cmd.Parameters.Add(prmUserId);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Repeater1.DataSource = dr;
            Repeater1.DataBind();
            multiView.SetActiveView(viewResponseFound);
        }
        else
        {
            multiView.SetActiveView(viewResponseNotFound);
        }
        con.Close();
    }
}