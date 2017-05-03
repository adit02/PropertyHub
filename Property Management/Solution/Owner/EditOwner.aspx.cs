using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Owner_EditOwner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string firstName = txtFirstName.Text;
        string lastName = txtLastName.Text;
        string phone = txtPhone.Text;
        string address = txtAddress.Text;
        string city = txtCity.Text;

        SqlParameter prmUserID = new SqlParameter("@userid", SqlDbType.NVarChar, 50);
        prmUserID.Value = Session["username"].ToString();
        
        SqlParameter prmFirstName = new SqlParameter("@firstname", SqlDbType.NVarChar, 50);
        prmFirstName.Value = firstName.ToString();

        SqlParameter prmLastName = new SqlParameter("@lastname", SqlDbType.NVarChar, 50);
        prmLastName.Value = lastName.ToString();

        SqlParameter prmPhone = new SqlParameter("@phone", SqlDbType.NVarChar, 50);
        prmPhone.Value = phone.ToString();

        SqlParameter prmAddress = new SqlParameter("@address", SqlDbType.NVarChar, 100);
        prmAddress.Value = address.ToString();

        SqlParameter prmCity = new SqlParameter("@city", SqlDbType.NVarChar, 50);
        prmCity.Value = city.ToString();

        //Create SQL Connection
        String cmdString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(cmdString);

        //Create SQL Command
        SqlCommand cmd = new SqlCommand();        
        cmd.CommandText = "Update UserDetails " +
                            "set firstname=@firstname,lastname=@lastname,phone=@phone,address=@address,city=@city " +
                            "where userid=@userid";
        cmd.Connection = con;
        cmd.Parameters.Add(prmUserID);
        cmd.Parameters.Add(prmFirstName);
        cmd.Parameters.Add(prmLastName);
        cmd.Parameters.Add(prmPhone);
        cmd.Parameters.Add(prmAddress);
        cmd.Parameters.Add(prmCity);


        con.Open();
        int result = cmd.ExecuteNonQuery();
        con.Close();

        if (result > 0)
        {
            multiView.SetActiveView(viewUserUpdated);
        }
    }
}