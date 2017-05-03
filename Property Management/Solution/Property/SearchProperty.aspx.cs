using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Property_SearchProperty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Debug.WriteLine("On Page Load");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string postedfor;

        if (rbnBuy.Checked == true)
        {
            postedfor = "Sale";
        }
        else
        {
            postedfor = "Rent";
        }

        string propertytype = ddlPropertyType.SelectedValue;
        string location = ddlLocation.SelectedValue;
        int bedrooms = int.Parse(ddlBedRooms.SelectedValue);
        decimal minArea = decimal.Parse(txtCoveredAreaMinLimit.Text);
        decimal maxArea = decimal.Parse(txtCoveredAreaMaxLimit.Text);
        decimal minBudget = decimal.Parse(txtMinBudget.Text);
        decimal maxBudget = decimal.Parse(txtMaxBudget.Text);

        SqlParameter prmPropertyType = new SqlParameter("@propertytype", SqlDbType.NVarChar, 50);
        prmPropertyType.Value = propertytype.ToString();

        SqlParameter prmPostedFor = new SqlParameter("@postedfor", SqlDbType.NVarChar);
        prmPostedFor.Value = postedfor.ToString();

        SqlParameter prmCity = new SqlParameter("@city", SqlDbType.NVarChar);
        prmCity.Value = location.ToString();

        SqlParameter prmBedRooms = new SqlParameter("@bedrooms", SqlDbType.Int);
        prmBedRooms.Value = bedrooms;

        SqlParameter prmMinArea = new SqlParameter("@minarea", SqlDbType.Decimal);
        prmMinArea.Value = minArea;

        SqlParameter prmMaxArea = new SqlParameter("@maxarea", SqlDbType.Decimal);
        prmMaxArea.Value = maxArea;

        SqlParameter prmMinBudget = new SqlParameter("@minbudget", SqlDbType.Decimal);
        prmMinBudget.Value = minBudget;

        SqlParameter prmMaxBudget = new SqlParameter("@maxbudget", SqlDbType.Decimal);
        prmMaxBudget.Value = maxBudget;
        
        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        Debug.WriteLine("before sql command");
        SqlCommand cmd = new SqlCommand();
        
       
        cmd.CommandText = "select * from property " +
                            "where propertytype=@propertytype and postedfor=@postedfor and city=@city and bedrooms=@bedrooms and totalprice>=@minbudget and totalprice<=@maxbudget and coveredarea>=@minarea and coveredarea<=@maxarea";

        cmd.Connection = con;

        Debug.WriteLine("after sql connection");

        cmd.Parameters.Add(prmPropertyType);
        cmd.Parameters.Add(prmPostedFor);
        cmd.Parameters.Add(prmCity);
        cmd.Parameters.Add(prmBedRooms);
        cmd.Parameters.Add(prmMinArea);
        cmd.Parameters.Add(prmMaxArea);
        cmd.Parameters.Add(prmMinBudget);
        cmd.Parameters.Add(prmMaxBudget);

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