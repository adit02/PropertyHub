using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Property_ManageRequirements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userid = Session["username"].ToString();

        SqlParameter prmUserId = new SqlParameter("@userid", SqlDbType.NVarChar);
        prmUserId.Value = userid.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM [Requirement] WHERE ([userid] = @userid) ORDER BY [bedrooms]";
        cmd.Connection = con;

        cmd.Parameters.Add(prmUserId);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            Repeater1.DataSource = dr;
            Repeater1.DataBind();
            multiView.SetActiveView(viewRequirementFound);
        }
        else
        {
            multiView.SetActiveView(viewRequirementNotFound);
        }
        con.Close();
    }
    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        int requirementid = int.Parse(e.CommandArgument.ToString());
        string userid = Session["username"].ToString();

        SqlParameter prmRequirementId = new SqlParameter("@requirementid", SqlDbType.Int);
        prmRequirementId.Value = requirementid;


        SqlParameter prmUserId = new SqlParameter("@userid", SqlDbType.NVarChar);
        prmUserId.Value = userid.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "delete from Requirement where requirementid=@requirementid";
        cmd.Connection = con;
        cmd.Parameters.Add(prmRequirementId);
        cmd.Parameters.Add(prmUserId);

        con.Open();
        int result = cmd.ExecuteNonQuery();

        if (result > 0)
        {
            cmd.CommandText = "SELECT * FROM [Requirement] WHERE ([userid] = @userid) ORDER BY [bedrooms]";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Repeater1.DataSource = dr;
                Repeater1.DataBind();
                multiView.SetActiveView(viewRequirementFound);
            }
            else
            {
                multiView.SetActiveView(viewRequirementNotFound);
            }
        }
        con.Close();
    }
}