using System;
using System.Collections.Generic;
using System.Web.UI;
using WebApplication3.Properties; // Ensure this matches the namespace of your Product class

namespace WebApplication3.Properties
{
    public partial class shop7 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization code can go here
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Create a new product object for the item being added to the cart
            Product product = new Product
            {
                ProductId = 7, // Unique ID for the product
                Name = "Glare Glide Square", // Product name
                Color = "Color: Transparent X Blue", // Product color
                Price = 30.00m, // Product price
                Quantity = 1, // Default quantity
                ImageUrl = "images/g-7.png" // Path to the product image
            };

            // Add the product to the cart
            List<Product> cart = GetCart();
            cart.Add(product);
            SaveCart(cart);

            // Redirect to the cart page
            Response.Redirect("cart.aspx");
        }

        private List<Product> GetCart()
        {
            // Check if the cart exists in the session; if not, create a new one
            if (Session["Cart"] == null)
            {
                Session["Cart"] = new List<Product>();
            }
            return (List<Product>)Session["Cart"];
        }

        private void SaveCart(List<Product> cart)
        {
            // Save the updated cart back to the session
            Session["Cart"] = cart;
        }


        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            // Example product details (you would typically get these from your data source)
            int productId = 7; // Replace with actual product ID
            string productName = "Glare Glide Square"; // Replace with actual product name
            string color = "Transparent X Blue";
            decimal productPrice = 30m; // Replace with actual product price


            // Create a new product item
            Product product = new Product
            {

                Name = productName,
                Color = color,
                Price = productPrice,
                Quantity = 1,// Default quantity
                ImageUrl = "images/g-7.png"
            };

            // Check if the cart session exists, if not create it
            if (Session["Cart"] == null)
            {
                Session["Cart"] = new List<Product>(); // Initialize a new cart
            }

            // Add the item to the cart
            var cart = (List<Product>)Session["Cart"];
            cart.Add(product);

            // Redirect to the cart page
            Response.Redirect("cart.aspx");
        }
    }
}