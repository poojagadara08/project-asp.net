using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            List<Product> cart = GetCart();
            rptCartItems.DataSource = cart;
            rptCartItems.DataBind();

            // Calculate totals
            CalculateTotals(cart);
        }

        private List<Product> GetCart()
        {
            if (Session["Cart"] == null)
            {
                Session["Cart"] = new List<Product>();
            }
            return (List<Product>)Session["Cart"];
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Button btnRemove = (Button)sender;
            int productId = Convert.ToInt32(btnRemove.CommandArgument);
            List<Product> cart = GetCart();

            // Find the product to remove
            Product itemToRemove = cart.Find(p => p.ProductId == productId);
            if (itemToRemove != null)
            {
                cart.Remove(itemToRemove);
                SaveCart(cart);
            }

            BindCart(); // Rebind the cart to reflect changes
        }

        private void SaveCart(List<Product> cart)
        {
            Session["Cart"] = cart;
        }

        private void CalculateTotals(List<Product> cart)
        {
            decimal subtotal = 0;

            foreach (var item in cart)
            {
                subtotal += item.TotalPrice; // Use the TotalPrice property
            }

            subtotalPrice.Text = $"${subtotal:F2}";
            totalPrice.Text = $"${subtotal:F2}"; // You can add discount and shipping logic here
        }

        protected void UpdateCartQuantities(object sender, EventArgs e)
        {
            List<Product> cart = GetCart();
            foreach (RepeaterItem item in rptCartItems.Items)
            {
                // Find the quantity input field
                var quantityInput = (TextBox)item.FindControl("quantity");
                var productId = Convert.ToInt32(((Button)item.FindControl("btnRemove")).CommandArgument);

                // Find the product in the cart
                var product = cart.Find(p => p.ProductId == productId);
                if (product != null)
                {
                    // Declare the newQuantity variable
                    int newQuantity;

                    // Try to parse the quantity input
                    if (int.TryParse(quantityInput.Text, out newQuantity))
                    {
                        product.Quantity = newQuantity; // Update the quantity
                    }
                    else
                    {
                        // Handle the case where parsing fails (e.g., set to 1 or show an error)
                        product.Quantity = 1; // Default to 1 if parsing fails
                    }
                }
            }

            
    

        SaveCart(cart); // Save the updated cart
            CalculateTotals(cart); // Recalculate totals
        }
    }

    [Serializable]
    public class Product
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public string Color { get; set; } // New property for color
        public decimal Price { get; set; }
        public int Quantity { get; set; }

        public string ImageUrl { get; set; }
        public decimal TotalPrice => Price * Quantity; // Calculate total price for the item
    }
}