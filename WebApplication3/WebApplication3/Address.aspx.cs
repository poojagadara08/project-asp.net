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
    public partial class Address : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [address] ([Firstname],[Lastname],[Zipcode],[Address],[Email],[Number]) VALUES(@Firstname,@Lastname,@Zipcode,@Address,@Email,@Number)", con);
            cmd.Parameters.AddWithValue("Firstname",firstNameTextBox.Text );
            cmd.Parameters.AddWithValue("Lastname", lastNameTextBox.Text);
            cmd.Parameters.AddWithValue("Zipcode", zipCodeTextBox.Text);
            cmd.Parameters.AddWithValue("Address", addressTextBox.Text);
            cmd.Parameters.AddWithValue("Email", emailTextBox.Text);
            cmd.Parameters.AddWithValue("Number", phoneTextBox.Text);
            con.Open();

            // Execute the command
            cmd.ExecuteNonQuery();

            // Optionally, you can clear the text boxes after insertion
            firstNameTextBox.Text = "";
            lastNameTextBox.Text = "";
            zipCodeTextBox.Text = "";
            addressTextBox.Text = "";
            emailTextBox.Text = "";
            phoneTextBox.Text = "";

            string script = "alert('Your Details Submited..');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
    }
}