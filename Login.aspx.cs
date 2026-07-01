using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JunBatch2026WebFormApp
{
	public partial class Login : System.Web.UI.Page
	{
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user = TextBox1.Text;
            string pass = TextBox2.Text;
            string q = $"exec sp_Auth_Login '{user}','{pass}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if(rdr.HasRows)
            {
                
                while(rdr.Read())
                {
                    Session["US"] = rdr["username"].ToString(); //activate th session
                    if (rdr["urole"].Equals("Admin"))
                    {
                        Response.Redirect("Admin/AdminHome.aspx");
                    }
                    if(rdr["urole"].Equals("User"))
                    {
                        Response.Redirect("User/UserHome.aspx");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials')</script>");

                //Session.Abandon();//destroy the session
            }
        }
    }
}

