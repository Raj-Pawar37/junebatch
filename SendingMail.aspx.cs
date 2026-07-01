using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JunBatch2026WebFormApp
{
	public partial class SendingMail : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Button1_Click(object sender, EventArgs e)
        {
			MailMessage mail = new MailMessage();
			mail.From = new MailAddress("khelojikrish@gmail.com");
			mail.To.Add(TextBox1.Text);
			mail.Subject = TextBox2.Text;
			mail.Body = "It is Testing Mail";

			//Attachment attachment = new Attachment(FileUpload1.PostedFile.InputStream, FileUpload1.PostedFile.FileName);
			//mail.Attachments.Add(attachment);

			foreach(HttpPostedFile postedFile in FileUpload1.PostedFiles)
			{
                Attachment attachment = new Attachment(postedFile.InputStream, postedFile.FileName);
                mail.Attachments.Add(attachment);
            }


            SmtpClient client = new SmtpClient("smtp.gmail.com");
			client.Credentials = new NetworkCredential("khelojikrish@gmail.com", "ypvsrskptntxabrs");
			client.Port = 587;
			client.EnableSsl = true;
			client.Send(mail);
			Response.Write("<script>alert('Mail Send Successfully!')</script>");
        }
    }
}