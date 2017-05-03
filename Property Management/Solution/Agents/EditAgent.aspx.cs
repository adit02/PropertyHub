using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Agents_EditAgent : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        #region Local Variables
        string userid = Session["username"].ToString();
        string agentName = txtAgentName.Text;
        string companyName = txtCompanyName.Text;
        HttpPostedFile companyLogo;
        byte[] imageSize;

        #region Picture Load
        if (fileUploadCompanyLogo.PostedFile != null && fileUploadCompanyLogo.PostedFile.FileName != "")
        {
            imageSize = new byte[fileUploadCompanyLogo.PostedFile.ContentLength];
            companyLogo = fileUploadCompanyLogo.PostedFile;
            companyLogo.InputStream.Read(imageSize, 0, (int)fileUploadCompanyLogo.PostedFile.ContentLength);
        }
        else
        {
            imageSize = null;
            companyLogo = null;
        }
        #endregion

        int operatingSince = int.Parse(ddlOperatingSince.SelectedValue);
        string title = txtCompanyTitle.Text;

        #region Transaction Types
        string transactionType = "";
        foreach (ListItem item in cbxTransactionTypes.Items)
        {
            if (item.Selected)
            {
                transactionType += item.Text + "<br />";
            }
        }
        #endregion

        #region Property Types
        string propertyType = "";
        foreach (ListItem item in cbxPropertyTypes.Items)
        {
            if (item.Selected)
            {
                propertyType += item.Text + "<br />";
            }
        }
        Response.Write(propertyType);
        #endregion

        string shortDescription = "";
        string longDescription = txtDescription.Text;
        string authorizedAgents = txtAuthorisedAgents.Text;

        string city = ddlCity.SelectedValue;
        string locality = ddlLocality.SelectedValue;
        #endregion

        #region Setting Sql Connection
        // Create SQL Connection 
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;

        // Create SQL Command 
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "Update Agents " +
                            "set AgentName=@agentname,CompanyName=@companyname,CompanyLogo=@companylogo,OperatingSince=@operatingsince,Title=@title,TransactionType=@transactiontypes,PropertyType=@propertytypes,ShortDescription=@shortdescription,LongDescription=@longdescription,AuthorisedAgents=@authorisedagents,City=@city,Locality=@locality " +
                            "where userid=@userid";

        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        #endregion

        #region Parameter List
        SqlParameter prmUserId = new SqlParameter("@userid", SqlDbType.NVarChar, 50);
        prmUserId.Value = userid.ToString();
        cmd.Parameters.Add(prmUserId);

        SqlParameter prmAgentName = new SqlParameter("@agentname", SqlDbType.NVarChar, 50);
        prmAgentName.Value = agentName.ToString();
        cmd.Parameters.Add(prmAgentName);

        SqlParameter prmCompanyName = new SqlParameter("@companyname", SqlDbType.VarChar, 100);
        prmCompanyName.Value = companyName.ToString();
        cmd.Parameters.Add(prmCompanyName);

        SqlParameter prmCompanyLogo = new SqlParameter("@companylogo", SqlDbType.Image, imageSize.Length);
        prmCompanyLogo.Value = imageSize;
        cmd.Parameters.Add(prmCompanyLogo);

        SqlParameter prmOperatingSince = new SqlParameter("@operatingsince", SqlDbType.Int);
        prmOperatingSince.Value = operatingSince;
        cmd.Parameters.Add(prmOperatingSince);

        SqlParameter prmTitle = new SqlParameter("@title", SqlDbType.VarChar, 100);
        prmTitle.Value = title;
        cmd.Parameters.Add(prmTitle);

        SqlParameter prmTransactionTypes = new SqlParameter("@transactiontypes", SqlDbType.VarChar, 300);
        prmTransactionTypes.Value = transactionType;
        cmd.Parameters.Add(prmTransactionTypes);

        SqlParameter prmPropertyTypes = new SqlParameter("@propertytypes", SqlDbType.VarChar);
        prmPropertyTypes.Value = propertyType;
        cmd.Parameters.Add(prmPropertyTypes);

        SqlParameter prmShortDescription = new SqlParameter("@shortdescription", SqlDbType.VarChar, 100);
        prmShortDescription.Value = shortDescription;
        cmd.Parameters.Add(prmShortDescription);

        SqlParameter prmLongDescription = new SqlParameter("@longdescription", SqlDbType.VarChar, 3000);
        prmLongDescription.Value = longDescription;
        cmd.Parameters.Add(prmLongDescription);

        SqlParameter prmAuthorisedAgents = new SqlParameter("@authorisedagents", SqlDbType.VarChar, 3000);
        prmAuthorisedAgents.Value = authorizedAgents;
        cmd.Parameters.Add(prmAuthorisedAgents);

        SqlParameter prmCity = new SqlParameter("@city", SqlDbType.VarChar, 300);
        prmCity.Value = city;
        cmd.Parameters.Add(prmCity);

        SqlParameter prmLocality = new SqlParameter("@locality", SqlDbType.VarChar, 1000);
        prmLocality.Value = locality;
        cmd.Parameters.Add(prmLocality);
        #endregion

        con.Open();
        int result = cmd.ExecuteNonQuery();
        con.Close();

        if (result > 0)
            multiView.SetActiveView(viewAgentUpdated);
    }
}
