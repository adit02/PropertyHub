using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Property_ContactProperty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int propertyid = int.Parse(Request.QueryString["propertyid"].ToString());
        DateTime date = DateTime.Today;
        string contactname = txtName.Text;
        string contactemail = txtEmail.Text;
        string contactphone = txtPhone.Text;
        string contactmessage = txtMessage.Text;

        SqlParameter prmPropertyId = new SqlParameter("@propertyid", SqlDbType.Int);
        prmPropertyId.Value = propertyid;

        SqlParameter prmDateofResponse = new SqlParameter("@dateofresponse", SqlDbType.Date);
        prmDateofResponse.Value = date.Date;

        SqlParameter prmContactName = new SqlParameter("@contactname", SqlDbType.NVarChar, 50);
        prmContactName.Value = contactname.ToString();

        SqlParameter prmContactEmail = new SqlParameter("@contactemail", SqlDbType.NVarChar, 50);
        prmContactEmail.Value = contactemail.ToString();

        SqlParameter prmContactPhone = new SqlParameter("@contactphone", SqlDbType.NVarChar, 50);
        prmContactPhone.Value = contactphone.ToString();

        SqlParameter prmContactMessage = new SqlParameter("@contactmessage", SqlDbType.NVarChar, 2000);
        prmContactMessage.Value = contactmessage.ToString();

        string conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "insert into Response " +
                            "(propertyid,dateofresponse,contactname,contactemail,contactphone,contactmessage) " +
                            "values(@propertyid,@dateofresponse,@contactname,@contactemail,@contactphone,@contactmessage)";
        cmd.Connection = con;
        cmd.Parameters.Add(prmPropertyId);
        cmd.Parameters.Add(prmDateofResponse);
        cmd.Parameters.Add(prmContactName);
        cmd.Parameters.Add(prmContactPhone);
        cmd.Parameters.Add(prmContactEmail);
        cmd.Parameters.Add(prmContactMessage);

        con.Open();
        int result = cmd.ExecuteNonQuery();
        con.Close();

        if (result > 0)
        {
            Response.Redirect("~/Property/ResponseAddedSuccessfully.aspx");
        }      
    }
}