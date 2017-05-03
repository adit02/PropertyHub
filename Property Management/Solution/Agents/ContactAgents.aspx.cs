using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Agents_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string agentid = Request.QueryString["agentid"].ToString();

        SqlParameter prmAgentId = new SqlParameter("@agentid", SqlDbType.NVarChar, 50);
        prmAgentId.Value = agentid.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from Agents as A,UserDetails as U " +
                            "where A.Userid=@agentid and A.Userid=U.userid";
        cmd.Connection = con;
        cmd.Parameters.Add(prmAgentId);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            dr.Read();
            lblCompanyName.Text = dr["CompanyName"].ToString();
            lblTitle.Text = dr["Title"].ToString();
            imgCompanylogo.ImageUrl = "Handler.ashx?ID=" + agentid;
            lblPhoneNo.Text = dr["phone"].ToString();
            lblAddress.Text = dr["address"].ToString();
            lbloperatingsince.Text = dr["operatingsince"].ToString();
            lblAboutUs.Text = dr["LongDescription"].ToString();
            lblLocation.Text = dr["Locality"].ToString();

            string ppType = dr["PropertyType"].ToString();
            string []delimiter = new String[]{"<br />"};
            string[] propertytype = ppType.Split(delimiter, StringSplitOptions.RemoveEmptyEntries);
            blstPropertyResidential.DataSource = propertytype;
            blstPropertyResidential.DataBind();


            lblCompanyName1.Text = dr["CompanyName"].ToString();
        }
        con.Close();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        string agentid=Request.QueryString["agentid"].ToString();
        string propertytype="Residential";

        SqlParameter prmAgentId = new SqlParameter("@agentid", SqlDbType.NVarChar, 50);
        prmAgentId.Value = agentid.ToString();

        SqlParameter prmPropertyType = new SqlParameter("@propertytype", SqlDbType.NVarChar, 50);
        prmPropertyType.Value = propertytype.ToString();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from property " +
                            "where userid=@agentid and propertytype=@propertytype";

        cmd.Connection = con;
        cmd.Parameters.Add(prmAgentId);
        cmd.Parameters.Add(prmPropertyType);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            multiView.SetActiveView(viewPropertyFound);
            Repeater1.DataSource = dr;
            Repeater1.DataBind();
        }
        else
        {
            multiView.SetActiveView(viewPropertyNotFound);
        }
        con.Close();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        string agentid=Request.QueryString["agentid"].ToString();
        string propertytype = "Commercial";

        SqlParameter prmAgentId = new SqlParameter("@agentid", SqlDbType.NVarChar, 50);
        prmAgentId.Value = agentid.ToString();

        SqlParameter prmPropertyType = new SqlParameter("@propertytype", SqlDbType.NVarChar, 50);
        prmPropertyType.Value = propertytype.ToString();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from property " +
                            "where userid=@agentid and propertytype=@propertytype";

        cmd.Connection = con;
        cmd.Parameters.Add(prmAgentId);
        cmd.Parameters.Add(prmPropertyType);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            multiView.SetActiveView(viewPropertyFound);
            Repeater1.DataSource = dr;
            Repeater1.DataBind();
        }
        else
        {
            multiView.SetActiveView(viewPropertyNotFound);
        }
        con.Close();
    }
}