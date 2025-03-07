﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication3.admin.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="https://cdn.datatables.net/2.2.2/css/jquery.dataTables.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.2.2/js/jquery.dataTables.js"></script>

     <style>
        .container {
            float:right;
            width:70%;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
             
        }
        .box{
            margin-left:320px;
            margin-top:40px;
        }
       
    </style>
   
<form runat="server">
    <div id="demo_info" class="box">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered display" Border="1" DataKeyNames="Id">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Number" HeaderText="Phone Number" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Message" HeaderText="Message" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="btn_delete" />
                </ItemTemplate>
            </asp:TemplateField>
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