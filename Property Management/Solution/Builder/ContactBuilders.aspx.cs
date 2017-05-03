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
        string builderid = Request.QueryString["builderid"].ToString();

        SqlParameter prmBuilderId = new SqlParameter("@builderid", SqlDbType.NVarChar, 50);
        prmBuilderId.Value = builderid.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from Builder as A,UserDetails as U " +
                            "where A.Userid=@builderid and A.Userid=U.userid";
        cmd.Connection = con;
        cmd.Parameters.Add(prmBuilderId);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            dr.Read();
            lblCompanyName.Text = dr["CompanyName"].ToString();
            lblTitle.Text = dr["Title"].ToString();
            imgCompanylogo.ImageUrl = "Handler.ashx?ID=" + builderid;
            lblPhoneNo.Text = dr["phone"].ToString();
            lblAddress.Text = dr["address"].ToString();
            lbloperatingsince.Text = dr["operatingsince"].ToString();
            lblAboutUs.Text = dr["DetailDescription"].ToString();
            lblLocation.Text = dr["Locality"].ToString();

            string ppType = dr["PropertyType"].ToString();
            string []delimiter = new String[]{"<br />"};
            string[] propertytype = ppType.Split(delimiter, StringSplitOptions.RemoveEmptyEntries);
            blstPropertyResidential.DataSource = propertytype;
            blstPropertyResidential.DataBind();

            lblPastProjects.Text = dr["pastprojects"].ToString();
            lblCurrentProjects.Text = dr["currentprojects"].ToString();
            lblCompanyName1.Text = dr["CompanyName"].ToString();
        }
        con.Close();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        string builderid=Request.QueryString["builderid"].ToString();
        string propertytype="Residential";

        SqlParameter prmBuilderId = new SqlParameter("@builderid", SqlDbType.NVarChar, 50);
        prmBuilderId.Value = builderid.ToString();

        SqlParameter prmPropertyType = new SqlParameter("@propertytype", SqlDbType.NVarChar, 50);
        prmPropertyType.Value = propertytype.ToString();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from property " +
                            "where userid=@builderid and propertytype=@propertytype";

        cmd.Connection = con;
        cmd.Parameters.Add(prmBuilderId);
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

        string builderid=Request.QueryString["builderid"].ToString();
        string propertytype = "Commercial";

        SqlParameter prmBuilderId = new SqlParameter("@builderid", SqlDbType.NVarChar, 50);
        prmBuilderId.Value = builderid.ToString();

        SqlParameter prmPropertyType = new SqlParameter("@propertytype", SqlDbType.NVarChar, 50);
        prmPropertyType.Value = propertytype.ToString();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from property " +
                            "where userid=@builderid and propertytype=@propertytype";

        cmd.Connection = con;
        cmd.Parameters.Add(prmBuilderId);
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