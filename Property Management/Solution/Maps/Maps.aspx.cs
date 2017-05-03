using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Maps_Maps : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String mapName = Request.QueryString["q"].ToString();

        lblMapName.Text = mapName;
        imgMap.ImageUrl = "Pictures/" + mapName + ".jpg";
    }
}