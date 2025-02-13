using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String Username = txtUsername.Text;
            String Password = txtPassword.Text;
            if(Username=="pooja" && Password=="123")
            {
                Response.Redirect("./admin/indexx.aspx");
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('Login Error..')</script>");
            }


        }
    }
}