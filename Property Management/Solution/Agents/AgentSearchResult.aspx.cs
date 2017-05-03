using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Agents_AgentSearchResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblLocation.Text = Request.QueryString["location"].ToString() + ", " + Request.QueryString["city"].ToString();

        string dealingin = Request.QueryString["dealingin"].ToString();
        string propertyhandled = Request.QueryString["propertyhandled"].ToString();
        string city = Request.QueryString["city"].ToString();
        string locality = Request.QueryString["location"].ToString();

        SqlParameter prmTxnType = new SqlParameter("@transactiontype", SqlDbType.NVarChar, 50);
        prmTxnType.Value = dealingin.ToString();

        SqlParameter prmPropertyType = new SqlParameter("@propertytype", SqlDbType.NVarChar, 100);
        prmPropertyType.Value = propertyhandled.ToString();

        SqlParameter prmCity = new SqlParameter("@city", SqlDbType.NVarChar, 50);
        prmCity.Value = city.ToString();

        SqlParameter prmLocality = new SqlParameter("@locality", SqlDbType.NVarChar, 50);
        prmLocality.Value = locality.ToString();

        String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        SqlConnection con = new SqlConnection(conString);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM [Agents] WHERE (([TransactionType] LIKE '%' + @transactiontype + '%') AND ([PropertyType] LIKE '%' + @propertytype + '%') AND ([City] = @city) AND ([Locality] = @locality))";
        cmd.Connection = con;

        cmd.Parameters.Add(prmTxnType);
        cmd.Parameters.Add(prmPropertyType);
        cmd.Parameters.Add(prmCity);
        cmd.Parameters.Add(prmLocality);

        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows)
        {
            multiview.SetActiveView(viewRecordFound);
            Repeater1.DataSource = dr;
            Repeater1.DataBind();
        }
        else
        {
            multiview.SetActiveView(viewRecordNotFound);
        }
        con.Close();
    }
}