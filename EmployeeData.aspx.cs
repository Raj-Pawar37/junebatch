using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace JunBatch2026WebFormApp
{
	public partial class EmployeeData : System.Web.UI.Page
	{
		SqlConnection conn;
		protected void Page_Load(object sender, EventArgs e)
		{
			string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
			conn = new SqlConnection(cs);
			conn.Open();

			if(!IsPostBack)
			{
                FetchManagers();
                FetchManagers2();
				FetchEmpList();

				
            }

			FetchRows();
            FetchRowsvikas();




        }

		public void FetchRows()
		{
            if (GridView1.Rows.Count > 0)
            {
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
			AddEmp();
        }
		public void FetchManagers()
		{
			string q = "sp_FetchManagerList";
			SqlCommand cmd = new SqlCommand(q,conn);
			SqlDataReader rdr = cmd.ExecuteReader();
			DropDownList1.DataSource = rdr;
			DropDownList1.DataTextField = "mname";
			DropDownList1.DataValueField = "mid";
			DropDownList1.DataBind();
        }

        public void FetchManagers2()
        {
            string q = "sp_FetchManagerList";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
			    

        }


        public void AddEmp()
		{
			string name=TextBox1.Text;
			double sal=double.Parse(TextBox2.Text);
			int mid = int.Parse(DropDownList1.SelectedValue.ToString());

			
			FileUpload1.SaveAs(Server.MapPath("Images/") + Path.GetFileName(FileUpload1.FileName)); //Images/User.png

			string profile = "Images/" + Path.GetFileName(FileUpload1.FileName);

            string q = $"exec sp_SaveNewEmp '{name}','{sal}','{mid}','{profile}'";

			SqlCommand cmd = new SqlCommand(q, conn);
			cmd.ExecuteNonQuery();
			Response.Write("Added");
			FetchEmpList();
			FetchRows();
		}

		public void FetchEmpList()
		{
			string q = "sp_FetchEmp";

			SqlCommand cmd = new SqlCommand(q, conn);
			SqlDataReader rdr = cmd.ExecuteReader();
			GridView1.DataSource = rdr;
			GridView1.DataBind();
		}

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
		
			if(e.CommandName == "Edit")
			{
                string id = e.CommandArgument.ToString();
				getbyEmployeeId(id);
                e.Handled = true;
            }
			else if (e.CommandName == "Delete")
			{
				
				int id = int.Parse(e.CommandArgument.ToString());
				string query = $"exec sp_DeleteEmployeeee '{id}'";
				SqlCommand cmd = new SqlCommand(query, conn);
				cmd.ExecuteNonQuery();
				FetchEmpList();
				


			}

		


        }

		//delete
		

		public void updateEmployee(int eid, string ename, decimal esalary, int mid)
		{
			string q = $"exec SP_Employee_Update '{eid}', '{ename}', '{esalary}', '{mid}' ";
			SqlCommand cmd = new SqlCommand(q, conn);
			cmd.ExecuteNonQuery();
        }
        public void getbyEmployeeId (string eid)
		{

            string q = $"exec SP_Employee_GetBYID '{eid}' ";
            SqlCommand cmd = new SqlCommand(q, conn);

			SqlDataReader rdr = cmd.ExecuteReader();

			if (rdr.Read())
			{


				TextBox1.Text = rdr["ename"].ToString();
				TextBox2.Text = rdr["esalary"].ToString();
				TextBox3.Text = rdr["eid"].ToString();
				//TextBox5.Text = rdr["mid"].ToString();
				

				FetchManagers();
				DropDownList1.SelectedValue = rdr["mid"].ToString();

				ScriptManager.RegisterStartupScript(
					this,
					this.GetType(),
					"Popup",
					"$('#exampleModal').modal('show');",
					true
					
					);

				
				
			}

        }


		
		




        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
			
		}

        protected void Button4_Click(object sender, EventArgs e)
        {
			int eid = int.Parse(TextBox3.Text);
			string ename = TextBox1.Text;
			decimal esalary = decimal.Parse(TextBox2.Text);
			int mid = int.Parse(DropDownList1.SelectedValue);



			updateEmployee(eid, ename, esalary, mid);
			FetchEmpList();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
			Label5.Text = $"Selected City {DropDownList2.SelectedValue}";
        }
    }
}