using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Builder_BuilderRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        #region Local Variables
        string userid = Session["username"].ToString();
        string buildername = txtBuilderName.Text;
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


        string detailDescription = txtDescription.Text;
        string currentprojects = txtCurrentProjects.Text;
        string pastprojects = txtPastProjects.Text;

        string city = ddlCity.SelectedValue;
        string locality = ddlLocality.SelectedValue;
        #endregion

        #region Setting Sql Connection
        // Create SQL Connection 
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;

        // Create SQL Command 
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "INSERT INTO Builder " +
                            "(Userid,BuilderName,CompanyName,CompanyLogo,OperatingSince,Title,TransactionType,PropertyType,DetailDescription,CurrentProjects, PastProjects, City,Locality)" +
                            "VALUES (@userid,@buildername,@companyname,@companylogo,@operatingsince,@title,@transactiontypes,@propertytypes,@detaildescription,@currentprojects,@pastprojects,@city,@locality)";

        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        #endregion

        #region Parameter List
        SqlParameter prmUserId = new SqlParameter("@userid", SqlDbType.NVarChar, 50);
        prmUserId.Value = userid.ToString();
        cmd.Parameters.Add(prmUserId);

        SqlParameter prmBuilderName = new SqlParameter("@buildername", SqlDbType.NVarChar, 50);
        prmBuilderName.Value = buildername.ToString();
        cmd.Parameters.Add(prmBuilderName);

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

        SqlParameter prmDetailDescription = new SqlParameter("@detaildescription", SqlDbType.VarChar, 100);
        prmDetailDescription.Value = detailDescription;
        cmd.Parameters.Add(prmDetailDescription);

        SqlParameter prmCurrentProjects = new SqlParameter("@currentprojects", SqlDbType.VarChar, 3000);
        prmCurrentProjects.Value = currentprojects;
        cmd.Parameters.Add(prmCurrentProjects);


        SqlParameter prmPastProjects = new SqlParameter("@PastProjects", SqlDbType.VarChar, 3000);
        prmPastProjects.Value = pastprojects;
        cmd.Parameters.Add(prmPastProjects);

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
        {
            cmd.CommandText = "Update Users " +
                                "Set userstatus=1 " +
                                "where userid=@userid";

            con.Open();
            result = cmd.ExecuteNonQuery();
            con.Close();

            if (result > 0)
                Response.Redirect("~/Users/UserConfirmed.aspx");
        }
    }
}


    
