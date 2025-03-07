<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication3.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- MDB CSS Link -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>

    <style>
        .gradient-custom-3 {
            background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
        }
        .gradient-custom-4 {
            background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
        }

        /* Force black border for form elements */
        .form-control {
            border: 1px solid black !important; /* Add a solid black border */
            border-radius: 5px; /* Optional: add some rounded corners */
        }

        .form-control:focus {
            border-color: black !important; /* Keep black border when focused */
            outline: none; /* Remove default outline */
        }

        /* Optional: Add spacing between form elements */
        .form-outline {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
 <form id="form1" runat="server">
        <section class="vh-100 bg-image">
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card" style="border-radius: 15px;">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5">Create an account</h2>
                                     <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
                                    <!-- Registration Form -->
                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-lg" />
                                        <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName" CssClass="form-label">Your Name</asp:Label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-lg" TextMode="Email" />
                                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="form-label">Your Email</asp:Label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password" />
                                        <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" CssClass="form-label">Password</asp:Label>
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" >
                                            <Columns>
                                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString1 %>" DeleteCommand="DELETE FROM [registration] WHERE [Id] = @Id" InsertCommand="INSERT INTO [registration] ([Name], [Email], [Password]) VALUES (@Name, @Email, @Password)" ProviderName="<%$ ConnectionStrings:ProjectConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Name], [Email], [Password] FROM [registration]" UpdateCommand="UPDATE [registration] SET [Name] = @Name, [Email] = @Email, [Password] = @Password WHERE [Id] = @Id">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Name" Type="String" />
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="Password" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Name" Type="String" />
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="Password" Type="String" />
                                                <asp:Parameter Name="Id" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password" />
                                        <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword" CssClass="form-label" Height="41px" >Confirm your password</asp:Label>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" >
                                            <Columns>
                                                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString1 %>" DeleteCommand="DELETE FROM [registration] WHERE [Id] = @Id" InsertCommand="INSERT INTO [registration] ([Name], [Email], [Password]) VALUES (@Name, @Email, @Password)" ProviderName="<%$ ConnectionStrings:ProjectConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Name], [Email], [Password] FROM [registration]" UpdateCommand="UPDATE [registration] SET [Name] = @Name, [Email] = @Email, [Password] = @Password WHERE [Id] = @Id">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Name" Type="String" />
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="Password" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Name" Type="String" />
                                                <asp:Parameter Name="Email" Type="String" />
                                                <asp:Parameter Name="Password" Type="String" />
                                                <asp:Parameter Name="Id" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </div>

                                    <div class="form-check d-flex justify-content-center mb-5">
                                        <asp:CheckBox ID="chkTerms" runat="server" CssClass="form-check-input me-2" />
                                        <asp:Label ID="lblTerms" runat="server" AssociatedControlID="chkTerms" CssClass="form-check-label">
                                            I agree all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                                        </asp:Label>
                                    </div>
                                   

                                    <!-- Register Button -->
                                    <div class="d-flex justify-content-center">
                                        <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-success btn-block btn-lg gradient-custom-4 text-body" Text="Register" OnClick="btnRegister_Click" />
                                    </div>

                                    <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="login.aspx" class="fw-bold text-body"><u>Login here</u></a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
