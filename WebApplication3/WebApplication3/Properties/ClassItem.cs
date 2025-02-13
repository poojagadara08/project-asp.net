using System;

namespace WebApplication3.Properties
{
    public class ClassItem
    {
        public string Name { get; set; }      // Name of the product
        public decimal Price { get; set; }    // Price of the product
        public int Quantity { get; set; }     // Quantity of the product

        // Constructor that requires parameters
        public ClassItem(string name, decimal price, int quantity) // Change CartItem to ClassItem
        {
            Name = name;
            Price = price;
            Quantity = quantity;
        }
    }
}