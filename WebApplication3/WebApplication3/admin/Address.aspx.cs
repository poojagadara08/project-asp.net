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
    public partial class Address : System.Web.UI.Page
    {
        // Connection string from Web.config
        private string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            // Create a new SqlConnection
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // SQL command to select data from the contact table
                SqlCommand cmd = new SqlCommand("SELECT Id, Firstname, Lastname, Zipcode, Address,Email,Number FROM address", con);

                // Create a data adapter to fill the DataTable
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                // Open the connection
                con.Open();

                // Fill the DataTable with data from the database
                da.Fill(dt);

                // Bind the DataTable to the GridView
                GridView1.DataSource = dt;
                GridView1.DataBind();
            } // Connection is automatically closed here
        }

        protected void btn_delete(object sender, EventArgs e)
        {
            // Find the button that was clicked
            Button btnDelete = (Button)sender;

            // Get the GridViewRow that contains the button
            GridViewRow row = (GridViewRow)btnDelete.NamingContainer;

            // Get the data key (or any unique identifier) for the row
            int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

            // Call your method to delete the record from the database
            DeleteRecord(id);

            // Rebind the GridView to reflect the changes
            BindGrid();
        }

        private void DeleteRecord(int id)
        {
            // Implement your logic to delete the record from the database
            // For example, using ADO.NET or Entity Framework
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM address WHERE Id = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }
        }
    }
    
}