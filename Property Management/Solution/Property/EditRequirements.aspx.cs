using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Property_EditRequirements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        multiview.SetActiveView(viewUpdateRequirement);
    }
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
  #region Local Variables

        int requirementid = int.Parse(Request.QueryString["requirementid"].ToString());
        string propertyto="";
        string propertytype;
        string locality;
        int bedrooms;
        decimal minarea;
        decimal maxarea;
        decimal minbudget;
        decimal maxbudget;

        #endregion

        #region Assigning Variables             

        if (rbnBuy.Checked == true)
        {
            propertyto = "Buy";
        }
        else
        {
            propertyto = "Rent";
        }

        propertytype = ddlPropertyType.SelectedValue;
        locality = ddlLocation.SelectedValue;
        bedrooms = int.Parse(ddlBedRooms.SelectedValue);

        minarea = decimal.Parse(txtCoveredAreaMinLimit.Text);
        maxarea = decimal.Parse(txtCoveredAreaMaxLimit.Text);

        minbudget = decimal.Parse(txtMinBudget.Text);
        maxbudget = decimal.Parse(txtMaxBudget.Text);

        #endregion

        #region Sql Parameters

        SqlParameter prmRequirementid = new SqlParameter("@requirementid", SqlDbType.VarChar, 50);
        prmRequirementid.Value = requirementid.ToString();

        SqlParameter prmPropertyTo = new SqlParameter("@propertyto", SqlDbType.VarChar, 50);
        prmPropertyTo.Value = propertyto.ToString();

        SqlParameter prmPropertyType = new SqlParameter("@propertytype", SqlDbType.VarChar, 100);
        prmPropertyType.Value = propertytype.ToString();

        SqlParameter prmLocality = new SqlParameter("@locality", SqlDbType.VarChar, 100);
        prmLocality.Value = locality.ToString();

        SqlParameter prmBedrooms = new SqlParameter("@bedrooms", SqlDbType.Int);
        prmBedrooms.Value = bedrooms;

        SqlParameter prmMinarea = new SqlParameter("@minarea", SqlDbType.Decimal);
        prmMinarea.Value = minarea;

        SqlParameter prmMaxarea = new SqlParameter("@maxarea", SqlDbType.Decimal);
        prmMaxarea.Value = maxarea;

        SqlParameter prmMinBudget = new SqlParameter("@minbudget", SqlDbType.Decimal);
        prmMinBudget.Value = minbudget;

        SqlParameter prmMaxBudget = new SqlParameter("@maxbudget", SqlDbType.Decimal);
        prmMaxBudget.Value = maxbudget;

        #endregion

        #region Sql Connection

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update Requirement "+
                        "set propertyto=@propertyto,propertytype=@propertytype,locality=@locality,bedrooms=@bedrooms,minarea=@minarea,maxarea=@maxarea,minbudget=@minbudget,maxbudget=@maxbudget "+
                        "where requirementid=@requirementid";
        cmd.Connection = con;

        cmd.Parameters.Add(prmRequirementid);
        cmd.Parameters.Add(prmPropertyTo);
        cmd.Parameters.Add(prmPropertyType);
        cmd.Parameters.Add(prmLocality);
        cmd.Parameters.Add(prmBedrooms);
        cmd.Parameters.Add(prmMinarea);
        cmd.Parameters.Add(prmMaxarea);
        cmd.Parameters.Add(prmMinBudget);
        cmd.Parameters.Add(prmMaxBudget);



        con.Open();
        int result = cmd.ExecuteNonQuery();
        con.Close();


        if (result > 0)
        {
            multiview.SetActiveView(viewRequirementUpdated);
        }
        #endregion
    }
}
    
