<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shop7.aspx.cs" Inherits="WebApplication3.shop7" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css" rel="stylesheet"/>
    <style>
        body {
            background-color: ButtonHighlight; /* Light gray background color for the entire page */
            margin: 0;
            height: 100vh; /* Full height */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: lightgoldenrodyellow; /* White background for the content area */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 80%; /* Responsive width */
            max-width: 600px; /* Maximum width */
        }

        .product-card {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
        }

        .btn {
            margin: 10px; /* Space between buttons */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-card">
                        <img src="images/g-7.png" alt="Product Image" class="img-fluid" />
                        <h3>Product Name</h3>
                        <p>Description of the product goes here.</p>
                        <p>Price: $30</p>
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-success" OnClick="btnAddToCart_Click" />
                        <asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" CssClass="btn btn-primary" OnClick="btnBuyNow_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>