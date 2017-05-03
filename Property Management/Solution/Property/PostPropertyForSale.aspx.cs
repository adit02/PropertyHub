using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Property_Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //Check Login Status

        if (Session["logged"] != null)
        {
            multiView.SetActiveView(viewMember);
        }
        else
        {
            multiView.SetActiveView(viewNonMember);
        }


        //Load Floors
        if (!Page.IsPostBack)
        {
            ddlFloorNo.Items.Clear();
            for (int i = 0; i <= 200; i++)
            {
                ddlFloorNo.Items.Add(i.ToString());
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        #region Local Variables
        //Setting up Local Variables
        string userId;
        string postedFor;
        string propertyType;
        string propertySubType;
        string txtType;
        string city;
        string locality;
        int bedrooms;
        int bathrooms;
        string furnished;
        int coveredArea;
        int plotLandArea;
        int carpetArea;
        decimal totalprice;
        int floorNo;
        int totalFloors;
        string description;
        string possessionStatus;
        #endregion

        #region Assigning Local Variables
        
        userId = Session["username"].ToString();

        if (rbnPropertyForRent.Checked == true)
        {
            postedFor = "Rent";
        }
        else
        {
            postedFor = "Sale";
        }

        propertyType = ddlPropertyType.SelectedValue;
        propertySubType = ddlPropertySubType.SelectedValue;

        if (rbnTxnTypeNewProperty.Checked == true)
        {
            txtType = "New Property";
        }
        else
        {
            txtType = "Resale";
        }

        city = ddlCity.SelectedValue;
        locality = ddlLocality.SelectedValue;
        bedrooms = int.Parse(ddlBedRooms.SelectedValue);
        bathrooms = int.Parse(ddlBathRooms.SelectedValue);
        furnished = ddlFurnishStatus.SelectedValue;
        coveredArea = int.Parse(txtCoveredArea.Text);
        plotLandArea = int.Parse(txtPlotLandArea.Text);
        carpetArea = int.Parse(txtCarpetArea.Text);
        totalprice = decimal.Parse(txtTotalPrice.Text);
        floorNo = int.Parse(ddlFloorNo.SelectedValue);
        totalFloors = int.Parse(txtTotalFloors.Text);
        description = txtDescription.Text;

        if (rbnPossessionStatusReadyToMove.Checked == true)
        {
            possessionStatus = "Ready To Move";
        }
        else
        {
            possessionStatus = "Under Construction";
        }


        #endregion

        #region Command Parameters
        SqlParameter prmUserId = new SqlParameter("@userid", SqlDbType.VarChar, 50);
        prmUserId.Value = userId.ToString();

        SqlParameter prmPostedFor = new SqlParameter("@postedfor", SqlDbType.VarChar, 50);
        prmPostedFor.Value = postedFor.ToString();

        SqlParameter prmPropertyType = new SqlParameter("@propertytype", SqlDbType.VarChar, 50);
        prmPropertyType.Value = propertyType.ToString();

        SqlParameter prmPropertySubType = new SqlParameter("@propertysubtype", SqlDbType.VarChar, 50);
        prmPropertySubType.Value = propertySubType.ToString();

        SqlParameter prmTxnType = new SqlParameter("@txntype", SqlDbType.VarChar, 50);
        prmTxnType.Value = txtType.ToString();

        SqlParameter prmCity = new SqlParameter("@city", SqlDbType.VarChar, 50);
        prmCity.Value = city.ToString();

        SqlParameter prmLocality = new SqlParameter("@locality", SqlDbType.VarChar, 50);
        prmLocality.Value = locality.ToString();

        SqlParameter prmBedrooms = new SqlParameter("@bedrooms", SqlDbType.Int);
        prmBedrooms.Value = bedrooms;


        SqlParameter prmBathrooms = new SqlParameter("@bathrooms", SqlDbType.Int);
        prmBathrooms.Value = bathrooms;

        SqlParameter prmFurnished = new SqlParameter("@furnished", SqlDbType.VarChar, 50);
        prmFurnished.Value = furnished.ToString();

        SqlParameter prmCoveredArea = new SqlParameter("@coveredarea", SqlDbType.Int);
        prmCoveredArea.Value = coveredArea;

        SqlParameter prmPlotLandArea = new SqlParameter("@plotlandarea", SqlDbType.Int);
        prmPlotLandArea.Value = plotLandArea;

        SqlParameter prmCarpetArea = new SqlParameter("@carpetarea", SqlDbType.Int);
        prmCarpetArea.Value = carpetArea;

        SqlParameter prmTotalPrice = new SqlParameter("@totalprice", SqlDbType.Decimal);
        prmTotalPrice.Value = totalprice;

        SqlParameter prmFloorNo = new SqlParameter("@floorno", SqlDbType.Int);
        prmFloorNo.Value = floorNo;

        SqlParameter prmTotalFloors = new SqlParameter("@totalfloors", SqlDbType.Int);
        prmTotalFloors.Value = totalFloors;


        SqlParameter prmDescription = new SqlParameter("@description", SqlDbType.VarChar, 50);
        prmDescription.Value = description.ToString();


        SqlParameter prmPossessionStatus = new SqlParameter("@possessionstatus", SqlDbType.VarChar, 50);
        prmPossessionStatus.Value = possessionStatus.ToString();

        #endregion

        #region Sql Connection

        //Sql Connection
        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);
        
        //Sql Command
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "Insert into Property " +
                        "(userid,postedfor,propertytype,propertysubtype,txntype,city,locality,bedrooms,bathrooms,furnished,coveredarea,plotlandarea,carpetarea,totalprice,floorno, totalfloors, description,possessionstatus) " +
                        "values(@userid,@postedfor,@propertytype,@propertysubtype,@txntype,@city,@locality,@bedrooms,@bathrooms,@furnished,@coveredarea,@plotlandarea,@carpetarea,@totalprice,@floorno,@totalfloors,@description,@possessionstatus)";

        cmd.Connection = con;

        cmd.Parameters.Add(prmUserId);
        cmd.Parameters.Add(prmPostedFor);
        cmd.Parameters.Add(prmPropertyType);
        cmd.Parameters.Add(prmPropertySubType);
        cmd.Parameters.Add(prmTxnType);
        cmd.Parameters.Add(prmCity);
        cmd.Parameters.Add(prmLocality);
        cmd.Parameters.Add(prmBedrooms);
        cmd.Parameters.Add(prmBathrooms);
        cmd.Parameters.Add(prmFurnished);
        cmd.Parameters.Add(prmCoveredArea);
        cmd.Parameters.Add(prmPlotLandArea);
        cmd.Parameters.Add(prmCarpetArea);
        cmd.Parameters.Add(prmTotalPrice);
        cmd.Parameters.Add(prmFloorNo);
        cmd.Parameters.Add(prmTotalFloors);
        cmd.Parameters.Add(prmDescription);
        cmd.Parameters.Add(prmPossessionStatus);



        con.Open();
        int result = cmd.ExecuteNonQuery();
        con.Close();

        if (result > 0)
        {
            Response.Redirect("~/Property/PropertyAddedSuccessfully.aspx");
        }
        #endregion
    }
    protected void ddlPropertyType_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}