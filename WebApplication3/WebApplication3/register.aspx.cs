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
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString1"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Hide the GridView controls on initial load
                GridView1.Visible = false;
                GridView2.Visible = false;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Disable the button to prevent multiple clicks
            btnRegister.Enabled = false;

            SqlCommand cmd = new SqlCommand("INSERT INTO [registration] ([Name],[Email],[Password],[Confirm]) VALUES(@Name,@Email,@Password,@Confirm)", con);
            cmd.Parameters.AddWithValue("Name", txtName.Text);
            cmd.Parameters.AddWithValue("Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("Confirm", txtConfirmPassword.Text);

            try
            {
                con.Open();
                int res = cmd.ExecuteNonQuery();
                if (res == 1)
                {
                    // Clear the input fields immediately after successful registration
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtPassword.Text = "";
                    txtConfirmPassword.Text = "";

                    // Display success message
                    lblMessage.Text = "Registration successful!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    // Display error message
                    lblMessage.Text = "Registration failed. Please try again.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                // Handle any errors that may have occurred
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
                // Re-enable the button after the operation is complete
                btnRegister.Enabled = true;
            }
        }
    }
  }

