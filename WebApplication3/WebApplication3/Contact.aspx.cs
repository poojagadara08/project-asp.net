using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication3
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [contact] ([Name],[Number],[Email],[Message]) VALUES(@Name,@Number,@Email,@Message)", con);
            cmd.Parameters.AddWithValue("Name", txtName.Text);
            cmd.Parameters.AddWithValue("Number", txtPhone.Text);
            cmd.Parameters.AddWithValue("Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("Message", txtMessage.Text);
            con.Open();

            // Execute the command
            cmd.ExecuteNonQuery();

            // Optionally, you can clear the text boxes after insertion
            txtName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";

            string script = "alert('Your message has been sent successfully. We will get back to you shortly!');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
    }
}