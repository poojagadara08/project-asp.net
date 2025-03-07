<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication3.admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="https://cdn.datatables.net/2.2.2/css/jquery.dataTables.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.2.2/js/jquery.dataTables.js"></script>
    
    <style>
        /* Reduce padding for table cells */
        #example th, #example td {
            padding: 5px; /* Adjust this value to decrease space */
            border: 1px solid #ddd; /* Add border between columns */
        }

        /* Set the table width to 100% to prevent sliding */
        #example {
            width: 100%; /* Ensure the table fits within the container */
            border-collapse: collapse;
            margin-left:300px;/* Collapse borders */
        }

        /* Set a fixed height for the table and enable scrolling */
        .dataTables_wrapper {
            max-height: 400px; /* Set a maximum height */
            overflow-y: auto; /* Enable vertical scrolling */
        }

        /* Optional: Adjust the box margin if needed */
        .box {
            margin-bottom: 20px;
            margin-left:200px;/* Space between the box and the table */
        }
    </style>

  <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Registered Users</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Password" HeaderText="Password" />
                    
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <script>
        function eventFired(type) {
            let n = document.querySelector('#demo_info');
            n.innerHTML +=
                '<div>' + type + ' event - ' + new Date().getTime() + '</div>';
            n.scrollTop = n.scrollHeight;
        }

        $(document).ready(function () {
            $('#example').DataTable()
                .on('order.dt', () => eventFired('Order'))
                .on('search.dt', () => eventFired('Search'))
                .on('page.dt', () => eventFired('Page'));
        });
    </script>
</asp:Content>