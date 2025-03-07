using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace WebApplication3.admin
{
    public partial class AdminProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            // Get the connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString1"].ConnectionString;

            // Create a connection to the database
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Create a SQL command to select data from the Products table
                using (SqlCommand cmd = new SqlCommand("SELECT ID, ProductName, Price,ImageUrl, Color FROM Product", con))
                {
                    // Create a data adapter to fill the DataTable
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt); // Fill the DataTable with data from the database
                        GridView1.DataSource = dt; // Set the data source for the GridView
                        GridView1.DataBind(); // Bind the data to the GridView
                    }
                }
            }
        }
    }
}