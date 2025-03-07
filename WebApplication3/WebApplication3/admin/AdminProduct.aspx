<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="AdminProduct.aspx.cs" Inherits="WebApplication3.admin.AdminProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .color-box {
            width: 20px;
            height: 20px;
            display: inline-block;
            border: 1px solid #000;
        }
    </style>

</head>

   
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Color" HeaderText="Color" />
                </Columns>
            </asp:GridView>
        </div>
    </form>

</asp:Content>
