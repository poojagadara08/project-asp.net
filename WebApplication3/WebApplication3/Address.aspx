<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="WebApplication3.Address" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Address Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h1>Address Page</h1>
            <div class="row">
                <div class="col-md-8 mb-4">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h5 class="mb-0">Billing Details</h5>
                        </div>
                        <div class="card-body">
                           <div class="form-outline mb-4">
                                <asp:TextBox ID="firstNameTextBox" runat="server" CssClass="form-control" required="required" />
                                <label class="form-label" for="firstNameTextBox">First name</label>
                              <%--  <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="firstNameTextBox" ErrorMessage="First name is required." ForeColor="Red" />--%>
                            </div>
                            <div class="form-outline mb-4">
                                <asp:TextBox ID="lastNameTextBox" runat="server" CssClass="form-control" required="required" />
                                <label class="form-label" for="lastNameTextBox">Last name</label>
      <%--                          <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="lastNameTextBox" ErrorMessage="Last name is required." ForeColor="Red" />--%>
                            </div>
                            <div class="form-outline mb-4">
                                <asp:TextBox ID="zipCodeTextBox" runat="server" CssClass="form-control" required="required" />
                                <label class="form-label" for="zipCodeTextBox">Zip Code</label>
                                <%--<asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="zipCodeTextBox" ErrorMessage="Zip Code is required." ForeColor="Red" />--%>
                            </div>
                            <div class="form-outline mb-4">
                                <asp:TextBox ID="addressTextBox" runat="server" CssClass="form-control" required="required" />
                                <label class="form-label" for="addressTextBox">Address</label>
                                <%--<asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="addressTextBox" ErrorMessage="Address is required." ForeColor="Red" />--%>
                            </div>
                            <div class="form-outline mb-4">
                                <asp:TextBox ID="emailTextBox" runat="server" CssClass="form-control" TextMode="Email" required="required" />
                                <label class="form-label" for="emailTextBox">Email</label>
                            <%--    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Email is required." ForeColor="Red" />--%>
                            </div>
                            <div class="form-outline mb-4">
                                <asp:TextBox ID="phoneTextBox" runat="server" CssClass="form-control" MaxLength="10" required="required" TextMode="Phone" />
                                <label class="form-label" for="phoneTextBox">Phone</label>
                               <%-- <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="phoneTextBox" ErrorMessage="Phone number is required." ForeColor="Red" />--%>
                            </div>
                            <div class="form-outline mb-4">
                                <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSend_Click" />
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h5 class="mb-0">Price Details</h5>
                        </div>
                        <div class="card-body">
                            <ul class="list-group list-group-flush mt-3">
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                    Total
                                    <span id="total-amount">$0.00</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                    Shipping
                                    <span>Gratis</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                    <div>
                                        <strong>Total amount</strong>
                                    </div>
                                    <span><strong id="final-total">$0.00</strong></span>
                                </li>
                            </ul>
                            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="makePurchase()">Make purchase</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        // Function to retrieve the total price from the query parameters
        function getTotalFromQuery() {
            const urlParams = new URLSearchParams(window.location.search);
            const total = urlParams.get('total');
            if (total) {
                document.getElementById('total-amount').textContent = `$${parseFloat(total).toFixed(2)}`;
                document.getElementById('final-total').textContent = `$${parseFloat(total).toFixed(2)}`;
            }
        }

        // Call the function when the page loads
        window.onload = function () {
            getTotalFromQuery();
        };

        // Function to handle the purchase action
        function makePurchase() {
            // Check if all required fields are filled
            const firstName = document.getElementById('firstNameTextBox').value;
            const lastName = document.getElementById('lastNameTextBox').value;
            const zipCode = document.getElementById('zipCodeTextBox').value;
            const address = document.getElementById('addressTextBox').value;
            const email = document.getElementById('emailTextBox').value;
            const phone = document.getElementById('phoneTextBox').value;

            if (!firstName || !lastName || !zipCode || !address || !email || !phone) {
                alert("Please fill in all required fields.");
                return; // Stop the function if any field is empty
            }

            // Get the total amount from the final total element
            const totalAmount = document.getElementById('final-total').textContent.replace('$', ''); // Remove the dollar sign

            // Redirect to payment.aspx with the total amount as a query parameter
            window.location.href = `payment.aspx?total=${totalAmount}`;
        }
    </script>
</body>
</html>