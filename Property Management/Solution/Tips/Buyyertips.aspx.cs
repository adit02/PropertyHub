using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using System.Configuration;

public partial class Buyyertips : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt;
    int tipcount;
    int curtip;
    
    protected void Page_Load(object sender, EventArgs e)
    {
            String conString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
            con = new SqlConnection(conString);
            cmd = new SqlCommand("select * from BuyerTip", con);
            da = new SqlDataAdapter(cmd);

            dt = new DataTable();
            da.Fill(dt);

            tipcount = dt.Rows.Count;

        if(!IsPostBack)
        {
            curtip = 0;
            ViewState["currenttip"] = curtip;
            LoadTip();
        }
    }

    private void LoadTip()
    {
        lblHead.Text = dt.Rows[curtip]["tipname"].ToString();
        lblText.Text = dt.Rows[curtip]["tiptext"].ToString();
    }

    protected void LinkButton19_Click(object sender, EventArgs e)
    {
        if (ViewState["currenttip"] != null)
        {
            curtip = int.Parse(ViewState["currenttip"].ToString());
        }

        if (curtip == tipcount - 1)
        {
            curtip = 0;
        }
        else
        {
            curtip++;
        }
        ViewState["currenttip"] = curtip;
        LoadTip();
    }
    protected void LinkButton18_Click(object sender, EventArgs e)
    {
        if (ViewState["currenttip"] != null)
        {
            curtip = int.Parse(ViewState["currenttip"].ToString());
        }

        if (curtip == 0)
        {
            curtip = tipcount - 1;
        }
        else
        {
            curtip--;
        }

        ViewState["currenttip"] = curtip;
        LoadTip();
    }    
}