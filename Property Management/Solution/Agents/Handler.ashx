﻿<%@ WebHandler Language="C#" Class="Handler" %>
using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["csPropertyBazar"].ConnectionString;
        // Create SQL Command 
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select CompanyLogo from Agents where Userid=@ID";
        cmd.Connection = con;
        
        SqlParameter ImageID = new SqlParameter("@ID", System.Data.SqlDbType.VarChar,50);
        ImageID.Value = context.Request.QueryString["ID"];
        cmd.Parameters.Add(ImageID);
        
        con.Open();
        SqlDataReader dReader = cmd.ExecuteReader();
        dReader.Read();
        context.Response.BinaryWrite((byte[])dReader["CompanyLogo"]);
        dReader.Close();
        con.Close();
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
 
    
}