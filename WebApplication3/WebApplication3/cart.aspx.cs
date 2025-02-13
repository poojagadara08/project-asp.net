using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication3.Properties;

namespace WebApplication3
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the cart items from the session
                List<CartItem> cart = (List<CartItem>)Session["Cart"];
                if (cart != null)
                {
                    rptCartItems.DataSource = cart;
                    rptCartItems.DataBind();
                    CalculateTotal(cart);
                }
                else
                {
                    // Handle the case where the cart is empty
                    Response.Write("<p>Your cart is empty.</p>");
                }
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            // Get the name of the product to remove
            string productName = ((Button)sender).CommandArgument;
            System.Diagnostics.Debug.WriteLine($"Removing product: {productName}");

            // Retrieve the cart items from the session
            List<CartItem> cart = (List<CartItem>)Session["Cart"];
            if (cart != null)
            {
                // Log the current items in the cart
                foreach (var item in cart)
                {
                    System.Diagnostics.Debug.WriteLine($"Cart item: {item.Name}");
                }

                // Find the item to remove
                CartItem itemToRemove = cart.Find(item => item.Name.Equals(productName, StringComparison.OrdinalIgnoreCase));
                if (itemToRemove != null)
                {
                    cart.Remove(itemToRemove);
                    Session["Cart"] = cart; // Update the session
                    System.Diagnostics.Debug.WriteLine($"Removed item: {itemToRemove.Name}");
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Item not found in cart.");
                }
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("Cart is null.");
            }

            // Rebind the cart items to the repeater
            rptCartItems.DataSource = cart;
            rptCartItems.DataBind();
            CalculateTotal(cart);
        }

        private void CalculateTotal(List<CartItem> cart)
        {
            decimal subtotal = 0;
            foreach (var item in cart)
            {
                subtotal += item.Price * item.Quantity; // Calculate subtotal
            }

            // Update the subtotal and total price in the summary
            subtotalPrice.Text = subtotal.ToString("C"); // Format as currency
            totalPrice.Text = subtotal.ToString("C"); // Assuming no discounts or shipping for now
        }
    }

    public class CartItem
    {
        private string productName;
        private decimal productPrice;

        public CartItem(string productName, decimal productPrice, int quantity)
        {
            this.productName = productName;
            this.productPrice = productPrice;
            Quantity = quantity;
        }

        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
    }
}