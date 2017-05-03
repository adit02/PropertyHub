using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Data;

public partial class signup : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;


    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        #region Local Variables
        string navigateUrl = "";

        //Users
        string userid = txtUserName.Text;
        string password = txtPassword.Text;
        string question = ddlSecurityQuestion.SelectedValue;
        string answer = txtSecurityAnswer.Text;
        string email = txtEmailAccount.Text;
        int usertype=0;
        int userstatus=0;

        //UserDetails
        string firstName = txtFirstName.Text;
        string lastName = txtLastName.Text;
        string phone = txtPhone.Text;
        string address = txtAddress.Text;
        string city = txtCity.Text;
        #endregion

        #region Setting PostBackUrl for Button Submit and User Type
        if (ddlAccountType.SelectedValue.Equals("Owner"))
        {
            usertype = 0;
            userstatus = 1;
            navigateUrl = "~/Users/UserConfirmed.aspx";
            //btnSubmit.PostBackUrl = "~/Owner/OwnerConfirmed.aspx";
        }
        else if (ddlAccountType.SelectedValue.Equals("Agent"))
        {
            usertype = 1;
            userstatus = 0;
            navigateUrl = "~/Agents/AgentRegister.aspx";
            //btnSubmit.PostBackUrl = "~/Agents/AgentRegister.aspx";
        }
        else if (ddlAccountType.SelectedValue.Equals("Builder"))
        {
            usertype = 2;
            userstatus = 0;
            navigateUrl = "~/Builder/BuilderRegistration.aspx";
            //btnSubmit.PostBackUrl = "~/Builder/BuilderRegistration.aspx";
        }
        #endregion


        #region Parameter List
        //Users

        SqlParameter prmUserId = new SqlParameter("@userid", SqlDbType.NVarChar, 50);
        prmUserId.Value = userid.ToString();

        SqlParameter prmPassword = new SqlParameter("@password", SqlDbType.NVarChar, 50);
        prmPassword.Value = password.ToString();

        SqlParameter prmQuestion = new SqlParameter("@question", SqlDbType.NVarChar, 250);
        prmQuestion.Value = question.ToString();

        SqlParameter prmAnswer = new SqlParameter("@answer", SqlDbType.NVarChar, 100);
        prmAnswer.Value = answer.ToString();

        SqlParameter prmEmail = new SqlParameter("@email", SqlDbType.NVarChar, 50);
        prmEmail.Value = email.ToString();

        SqlParameter prmUserType = new SqlParameter("@usertype", SqlDbType.Int);
        prmUserType.Value = usertype;

        SqlParameter prmUserStatus = new SqlParameter("@userstatus", SqlDbType.Int);
        prmUserStatus.Value = userstatus;

        //UserDetails

        SqlParameter prmUserID = new SqlParameter("@userid", SqlDbType.NVarChar, 50);
        prmUserID.Value = userid.ToString();
        
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

        #endregion

        #region Setting Sql Connection
        //Create SQL Connection
        String cmdString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        con = new SqlConnection(cmdString);

        //Create SQL Command
        cmd = new SqlCommand();
        
        String command = "Insert into Users " +
                        "(userid,password,question,answer,email,usertype,userstatus) "+
                        "Values(@userid,@password,@question,@answer,@email,@usertype,@userstatus)";
        
        cmd.CommandText = command;
        cmd.Connection = con;
        cmd.Parameters.Add(prmUserId);
        cmd.Parameters.Add(prmPassword);
        cmd.Parameters.Add(prmQuestion);
        cmd.Parameters.Add(prmAnswer);
        cmd.Parameters.Add(prmEmail);
        cmd.Parameters.Add(prmUserType);
        cmd.Parameters.Add(prmUserStatus);

        #endregion

        con.Open();
        int result = cmd.ExecuteNonQuery();
        con.Close();

        if(result>0)
        {
            #region Setting Sql Command
            //Create SQL Command

            cmd = new SqlCommand();
            cmd.Parameters.Clear();

            command = "Insert into UserDetails " +
                            "(userid,firstname,lastname,phone,address,city) " +
                            "Values(@userid,@firstname,@lastname,@phone,@address,@city)";

            cmd.CommandText = command;
            cmd.Connection = con;
            cmd.Parameters.Add(prmUserID);
            cmd.Parameters.Add(prmFirstName);
            cmd.Parameters.Add(prmLastName);
            cmd.Parameters.Add(prmPhone);
            cmd.Parameters.Add(prmAddress);
            cmd.Parameters.Add(prmCity);

            #endregion

            con.Open();
            result = cmd.ExecuteNonQuery();
            con.Close();

            if (result > 0)
            {
                Session["username"] = txtUserName.Text;
                Session["logged"] = "true";
                Response.Redirect(navigateUrl);
            }
        }
    }
}