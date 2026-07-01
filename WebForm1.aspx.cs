using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JunBatch2026WebFormApp
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user, pass;
            user = TextBox1.Text;
            pass = TextBox2.Text;
            if(user.Equals(pass))
            {
                Response.Redirect("Welcome.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}