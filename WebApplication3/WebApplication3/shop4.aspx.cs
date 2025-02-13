using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class shop4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }
        protected void btnBuyNow_Click(object sender, EventArgs e)
        {

        }
    }
}