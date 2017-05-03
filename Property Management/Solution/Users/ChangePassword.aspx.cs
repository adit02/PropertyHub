using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Users_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (txtNewPassword.Text != txtRepeatNewPassword.Text)
        {
            lblErrorMessage.Text = "New Password and Repeat New Password doesn't Match";
            panelPasswordError.Visible = true;
        }
        else
        {
            string user = Session["username"].ToString();
            string oldpassword = txtCurrentPassword.Text;
            string newpassword = txtNewPassword.Text;

            SqlParameter prmUserName = new SqlParameter("@userid", SqlDbType.NVarChar, 50);
            prmUserName.Value = user.ToString();

            SqlParameter prmOldPassword = new SqlParameter("@oldpassword", SqlDbType.NVarChar, 50);
            prmOldPassword.Value = oldpassword.ToString();

            SqlParameter prmNewPassword = new SqlParameter("@newpassword", SqlDbType.NVarChar, 50);
            prmNewPassword.Value = newpassword.ToString();

            String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update Users " +
                                "set password=@newpassword " +
                                "where userid=@userid and password=@oldpassword";
            cmd.Connection = con;
            cmd.Parameters.Add(prmUserName);
            cmd.Parameters.Add(prmOldPassword);
            cmd.Parameters.Add(prmNewPassword);

            con.Open();

            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                multiView.SetActiveView(viewPasswordSet);
            }
            else
            {
                lblErrorMessage.Text = "Old password doesn't Not Match";
                panelPasswordError.Visible = true;
            }

            con.Close();
        }
    }
}
