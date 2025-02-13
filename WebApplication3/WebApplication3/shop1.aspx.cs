using System;
using System.Collections.Generic;
using System.Web.UI;
using WebApplication3.Properties; // Ensure this matches the namespace of your CartItem class

namespace WebApplication3.Properties
{
    public partial class shop1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization code can go here
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Capture product details
            string productName = "Lorem Ipsum dolor"; // This should be dynamic based on the product
            decimal productPrice = 50; // This should be dynamic based on the product
            int quantity = 1; // Default quantity

            // Create a cart item using the constructor with parameters
            var cartItem = new CartItem(productName, productPrice, quantity);

            // Add the item to the cart (session)
            List<CartItem> cart = (List<CartItem>)Session["Cart"] ?? new List<CartItem>();
            cart.Add(cartItem);
            Session["Cart"] = cart;

            // Redirect to the cart page
            Response.Redirect("cart.aspx");
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            // Similar logic as Add to Cart, but redirect to checkout
            string productName = "Lorem Ipsum dolor"; // This should be dynamic based on the product
            decimal productPrice = 50; // This should be dynamic based on the product
            int quantity = 1; // Default quantity

            // Create a cart item using the constructor with parameters
            var cartItem = new CartItem(productName, productPrice, quantity);

            List<CartItem> cart = (List<CartItem>)Session["Cart"] ?? new List<CartItem>();
            cart.Add(cartItem);
            Session["Cart"] = cart;

            Response.Redirect("checkout.aspx"); // Change to your actual checkout page
        }
    }
}