﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shop1.aspx.cs" Inherits="WebApplication3.Properties.shop1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css" rel="stylesheet"/>
    <style>
        body {
            background-color: ButtonHighlight;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background-color: lightgoldenrodyellow;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 80%;
            max-width: 600px;
        }
        .product-card {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
        }
        .btn {
            margin: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-card">
                        <img src="images/g-1.png" alt="Product Image" class="img-fluid" />
                        <h3>Luminary Black Oversize</h3>
                        <p>Color: Purple x Matte Black</p>
                        <p>Price: $50</p>
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-success" OnClick="btnAddToCart_Click" />
                         <asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" CssClass="btn btn-primary" OnClick="btnBuyNow_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>