using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Property_PropertyDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int propertyid = int.Parse(Request.QueryString["propertyid"].ToString());

        SqlParameter prmPropertyId = new SqlParameter("@propertyid", SqlDbType.Int);
        prmPropertyId.Value = propertyid;

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from Property as p, Users as u " +
                            "where p.userid= u.userid and propertyid=@propertyid";

        cmd.Connection = con;
        cmd.Parameters.Add(prmPropertyId);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();


        if (dr.HasRows)
        {
            dr.Read();
            if (dr["propertytype"].ToString().Equals("Residential"))
            {
                lblHeader.Text = dr["bedrooms"].ToString() + " BHK " + dr["propertysubtype"].ToString() + " For " + dr["postedfor"].ToString() + " in " + dr["locality"].ToString() + "," + dr["city"].ToString();
            }
            else
            {
                lblHeader.Text = dr["propertysubtype"].ToString() + " For " + dr["postedfor"].ToString() + " in " + dr["locality"].ToString() + "," + dr["city"].ToString();
            }

            string username = dr["userid"].ToString();
            lblTotalPrice.Text = "Total Price : Rs. " + dr["totalprice"].ToString();
            lblpossessionstatus.Text = dr["possessionstatus"].ToString();
            lblPropertyLocation.Text = dr["locality"].ToString();
            lblBedrooms.Text = dr["bedrooms"].ToString();
            lblBathrooms.Text = dr["bathrooms"].ToString();
            lblcoveredarea.Text = dr["coveredarea"].ToString();
            lblfurnished.Text = dr["furnished"].ToString();
            lblfloorno.Text = dr["floorno"].ToString();
            lbltotalfloors.Text = dr["totalfloors"].ToString();
            lbltransactiontype.Text = dr["txntype"].ToString();
            int userType = int.Parse(dr["userType"].ToString());
            con.Close();

            if (userType == 0)
            {
                lblProp.Text = "Owner Details";
                SqlParameter prmuserid = new SqlParameter("@userid", SqlDbType.NVarChar);
                prmuserid.Value = username.ToString();

                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "select firstname,lastname,address,city,email,phone from userdetails,users " +
                                    "where userdetails.userid=@userid and users.userid=userdetails.userid";
                cmd1.Connection = con;
                cmd1.Parameters.Add(prmuserid);

                con.Open();
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.HasRows)
                {
                    dr1.Read();
                    lblpropname.Text = dr1["firstname"].ToString() + " " + dr1["lastname"].ToString();
                    lblname.Text = dr1["firstname"].ToString() + " " + dr1["lastname"].ToString();
                    lnProfilePage.Visible = false;
                    lbladdress.Text = dr1["address"].ToString() + ", " + dr1["city"].ToString();
                    lblemail.Text = dr1["email"].ToString();
                    lblphone.Text = dr1["phone"].ToString();
                    btnContact.Text = "Contact Owner";
                }
                con.Close();
            }
            else if (userType == 1)
            {
                lblProp.Text = "Agent Details";

                SqlParameter prmuserid = new SqlParameter("@userid", SqlDbType.NVarChar);
                prmuserid.Value = username.ToString();

                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "select companyname,agentname,address,userdetails.city 'city',email,phone from agents,userdetails,users " +
                                    "where agents.userid=@userid and agents.userid=userdetails.userid and users.userid=agents.userid";
                cmd1.Connection = con;
                cmd1.Parameters.Add(prmuserid);

                con.Open();
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.HasRows)
                {
                    dr1.Read();
                    lblpropname.Text = dr1["companyname"].ToString();
                    lblname.Text = dr1["Agentname"].ToString();
                    lnProfilePage.Text = "View Agent Profile Page";
                    lnProfilePage.NavigateUrl = "~/Agents/ContactAgents.aspx?agentid=" + username;
                    lbladdress.Text = dr1["address"].ToString() + ", " + dr1["city"].ToString();
                    lblemail.Text = dr1["email"].ToString();
                    lblphone.Text = dr1["phone"].ToString();
                    btnContact.Text = "Contact Agent";
                }
                con.Close();
            }
            else
            {
                lblProp.Text = "Builder Details";

                SqlParameter prmuserid = new SqlParameter("@userid", SqlDbType.NVarChar);
                prmuserid.Value = username.ToString();

                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "select companyname,buildername,address,userdetails.city 'city',email,phone from builder,userdetails,users " +
                                    "where builder.userid=@userid and builder.userid=userdetails.userid and users.userid=builder.userid";
                cmd1.Connection = con;
                cmd1.Parameters.Add(prmuserid);

                con.Open();
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.HasRows)
                {
                    dr1.Read();
                    lblpropname.Text = dr1["companyname"].ToString();
                    lblname.Text = dr1["Buildername"].ToString();
                    lnProfilePage.Text = "View Builder Profile Page";
                    lnProfilePage.NavigateUrl = "~/Builder/ContactBuilders.aspx?builderid=" + username;
                    lbladdress.Text = dr1["address"].ToString() + ", " + dr1["city"].ToString();
                    lblemail.Text = dr1["email"].ToString();
                    lblphone.Text = dr1["phone"].ToString();
                    btnContact.Text = "Contact Builder";
                }
                con.Close();
            }

        }
        else
        {
            lblHeader.Text = "No Record Found";
        }

    }

    protected void postContactProperty(object sender, EventArgs e)
    {
        int propertyid = int.Parse(Request.QueryString["propertyid"].ToString());
        Response.Redirect("~/Property/ContactProperty.aspx?propertyid=" + propertyid);
    }
}