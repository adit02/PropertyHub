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

public partial class Users_Login : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        panelLoginError.Visible = false;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        #region Local Variables
        String username=txtUserID.Text;
        String password = txtPassword.Text;
        int usertype;
        int userstatus;
        string navigateUrl="";
        #endregion

        #region User Types
        if (ddlUserType.SelectedValue.Equals("Owner"))
        {
            usertype = 0;
        }
        else if (ddlUserType.SelectedValue.Equals("Agent"))
        {
            usertype = 1;
        }
        else
        {
            usertype = 2;
        }
        #endregion

        #region Parameter List
        SqlParameter prmUserName = new SqlParameter("@userid", SqlDbType.NVarChar, 50);
        prmUserName.Value = username.ToString();

        SqlParameter prmUserPassword = new SqlParameter("@password", SqlDbType.NVarChar, 50);
        prmUserPassword.Value = password.ToString();

        SqlParameter prmUserType = new SqlParameter("@usertype", SqlDbType.Int);
        prmUserType.Value = usertype;
        #endregion


        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;

        con = new SqlConnection(conString);
        cmd = new SqlCommand();

        cmd.CommandText = "select userstatus from Users " +
                            "where userid=@userid and password=@password and usertype=@usertype";
        cmd.Connection = con;
        cmd.Parameters.Add(prmUserName);
        cmd.Parameters.Add(prmUserPassword);
        cmd.Parameters.Add(prmUserType);

        con.Open();
        dr = cmd.ExecuteReader();
        dr.Read();

        if (dr.HasRows)
        {
            userstatus = int.Parse(dr["userstatus"].ToString());

            if (userstatus == 0) //User Registration is Not Complete go to Registration Page
            {
                if (usertype == 1)
                {
                    navigateUrl = "~/Agents/AgentRegister.aspx";
                }
                else if (usertype == 2)
                {
                    navigateUrl = "~/Builder/BuilderRegistration.aspx";
                }
            }
            else //User Registration is Complete go to Home Page
            {
                navigateUrl = "~/Home.aspx";
            }

            
            //Registering a new Session
            Session["username"] = username;
            Session["logged"] = "true";

            Response.Redirect(navigateUrl);
        }
        else
        {
            panelLoginError.Visible = true;
        }

        con.Close();
    }
}