<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="WebApplication3.cart" %>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <style>
        .shopping-cart {
            padding-bottom: 50px;
            font-family: 'Montserrat', sans-serif;
        }
        .shopping-cart .content {
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
            background-color: white;
        }
        .shopping-cart .block-heading {
            padding-top: 50px;
            margin-bottom: 40px;
            text-align: center;
        }
        .shopping-cart .items .product {
            margin-bottom: 20px;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        .shopping-cart .summary {
            border-top: 2px solid #5ea4f3;
            background-color: #f7fbff;
            padding: 30px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function updateTotalPrice(quantityInput, pricePerItem) {
        // Get the new quantity
        var newQuantity = $(quantityInput).val();

        // Calculate the new total price for this item
        var newTotalPrice = (newQuantity * pricePerItem).toFixed(2);

        // Update the total price display for this item
        var productId = quantityInput.id.split('_')[1]; // Get the product ID from the input ID
        $('#totalPrice_' + productId).text('$' + newTotalPrice);

        // Recalculate the overall cart totals
        recalculateCartTotals();
    }

    function recalculateCartTotals() {
        var subtotal = 0;

        // Iterate through each item's total price and sum them up
        $('[id^=totalPrice_]').each(function () {
            var itemTotal = parseFloat($(this).text().replace('$', '')) || 0; // Get the total price and handle NaN
            subtotal += itemTotal;
        });

        // Update the subtotal display
        $('#subtotalPrice').text('$' + subtotal.toFixed(2));

        // Update the total price display (you can add discount and shipping logic here)
        $('#totalPrice').text('$' + subtotal.toFixed(2));
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <main class="page">
            <section class="shopping-cart">
                <div class="container">
                    <div class="block-heading">
                        <h2>Shopping Cart</h2>
                        <p>Your selected items are listed below.</p>
                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12 col-lg-8">
                                <div class="items">
                                    <asp:Repeater ID="rptCartItems" runat="server">
                                    <ItemTemplate>
                                        <div class="product">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <img class="img-fluid mx-auto d-block image" src='<%# Eval("ImageUrl") %>' alt="Product Image" />
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="info">
                                                        <div class="row">
                                                            <div class="col-md-5 product-name">
                                                                <div class="product-name">
                                                                    <a href="shop.aspx"><%# Eval("Name") %></a>
                                                                    <span id="productName_<%# Eval("ProductId") %>" style="display:none;"><%# Eval("Name") %></span> <!-- Hidden span for product name -->
                                                                    <div class="product-info">
                                                                        <div>Color: <span class="value"><%# Eval("Color") %></span></div>
                                                                        <div>Price: <span class="value">$<%# Eval("Price") %></span></div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="col-md-4 quantity">
                                                                <label for="quantity">Quantity:</label>
                                                                <input id="quantity_<%# Eval("ProductId") %>" type="number" value="<%# Eval("Quantity") %>" min="1" class="form-control quantity-input" 
                                                                       onchange="updateTotalPrice(this, <%# Eval("Price") %>);" />
                                                            </div>
                                                            <div class="col-md-3 price">
                                                                <span id="totalPrice_<%# Eval("ProductId") %>">$<%# Eval("TotalPrice") %></span>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandArgument='<%# Eval("ProductId") %>' 
                                                                             OnClick="btnRemove_Click" CssClass="btn btn-danger" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-4">
                                <div class="summary">
                                    <h3>Summary</h3>
                                    <div class="summary-item"><span class="text">Subtotal</span><asp:Label ID="subtotalPrice" runat="server" Text="$0"></asp:Label></div>
                                    <div class="summary-item"><span class="text">Discount</span><span class="price">$0</span></div>
                                    <div class="summary-item"><span class="text">Shipping</span><span class="price">$0</span></div>
                                    <div class="summary-item"><span class="text">Total</span><asp:Label ID="totalPrice" runat="server" Text="$0"></asp:Label></div>
                                    <button type="button" class="btn btn-primary btn-lg btn-block" onclick="redirectToAddress();">Checkout</button>
                                    <script>
                                        function redirectToAddress() {
                                            const totalAmount = $('#totalPrice').text(); // Get the total amount
                                            const priceValue = totalAmount.replace('$', ''); // Remove the dollar sign
                                            window.location.href = `address.aspx?total=${priceValue}`; // Redirect with total as a query parameter
                                        }
                                        
                                            function redirectToPayment() {
                                                let productDetails = [];
                                            $('[id^=totalPrice_]').each(function () {
                                            const productId = $(this).attr('id').split('_')[1];
                                            const productName = $(`#productName_${productId}`).text(); // Get the product name
                                            const productPrice = $(this).text().replace('$', ''); // Get the product price
                                            productDetails.push(`${encodeURIComponent(productName)}:${productPrice}`); // Encode and format
                                            });

                                            const totalAmount = $('#totalPrice').text(); // Get the total amount
                                            const priceValue = totalAmount.replace('$', ''); // Remove the dollar sign
                                            const productQueryString = productDetails.join('|'); // Join product details with a separator
                                            window.location.href = `payment.aspx?total=${priceValue}&products=${productQueryString}`; // Redirect with total and product details
    }
                                    
                                    </script>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </section>
        </main>
    </form>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</html>