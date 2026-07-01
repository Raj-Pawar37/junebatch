using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JunBatch2026WebFormApp.Admin
{
	public partial class Admin : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["US"]!=null)
			{
				Label1.Text = Session["US"].ToString();
			}
			else
			{
				Response.Write("<script>alert('You Need Login');window.location.href='../Login.aspx';</script>");
			}
		}
	}
}