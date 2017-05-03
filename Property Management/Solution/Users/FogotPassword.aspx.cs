using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Users_FogotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string user = txtUserId.Text;

        SqlParameter prmUserName = new SqlParameter("@criteria", SqlDbType.NVarChar, 50);
        prmUserName.Value = user.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select question from Users " +
                            "where userid=@criteria or email=@criteria";
        cmd.Connection = con;
        cmd.Parameters.Add(prmUserName);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            dr.Read();
            multiView.SetActiveView(viewSecurityQuestion);
            ddlSecurityQuestion.Items.Add(dr["question"].ToString());
        }
        else
        {
            panelUserError.Visible = true;
        }

        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string user = txtUserId.Text;
        string answer = txtSecurityAnswer.Text;

        SqlParameter prmUserName = new SqlParameter("@criteria", SqlDbType.NVarChar, 50);
        prmUserName.Value = user.ToString();

        SqlParameter prmAnswer = new SqlParameter("@answer", SqlDbType.NVarChar);
        prmAnswer.Value = answer.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select userid from Users " +
                            "where (userid=@criteria or email=@criteria) and answer=@answer";
        cmd.Connection = con;
        cmd.Parameters.Add(prmUserName);
        cmd.Parameters.Add(prmAnswer);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            dr.Read();
            multiView.SetActiveView(viewResetPassword);
        }
        else
        {
            panelAnswerError.Visible = true;
        }

        con.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (txtNewPassword.Text!=txtRepeatNewPassword.Text)
        {
            panelPasswordError.Visible = true;
        }
        else
        {
            string user = txtUserId.Text;
            string password = txtNewPassword.Text;

            SqlParameter prmUserName = new SqlParameter("@criteria", SqlDbType.NVarChar, 50);
            prmUserName.Value = user.ToString();

            SqlParameter prmPassword = new SqlParameter("@password", SqlDbType.NVarChar, 50);
            prmPassword.Value = password.ToString();

            String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
            SqlConnection con = new SqlConnection(conString);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update Users " +
                                "set password=@password " +
                                "where userid=@criteria or email=@criteria";
            cmd.Connection = con;
            cmd.Parameters.Add(prmUserName);
            cmd.Parameters.Add(prmPassword);

            con.Open();

            int result = cmd.ExecuteNonQuery();

            if (result>0)
            {
                multiView.SetActiveView(viewPasswordSet);
            }

            con.Close();
        }
    }
}