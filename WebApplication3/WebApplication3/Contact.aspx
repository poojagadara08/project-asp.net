<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication3.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!-- contact section -->

  <section class="contact_section layout_padding">
    <div class="container">
      <h2>
        Request A call back
      </h2>
      <div class="">
        <div class="row">
          <div class="col-md-6 mx-auto">
            <form action="#" runat="server">
              <div class="contact_form-container">
                <div>

                 <div class="form-group">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Phone Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control message_input" TextMode="MultiLine" Placeholder="Message"></asp:TextBox>
                    </div>
                    <div class="mt-5 d-flex justify-content-center">
                        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" Text="Send" OnClick="btnSend_Click" />
                    </div>
                </div>

              </div>

            </form>
          </div>
        </div>
      </div>
    </div>
  </section>


  <!-- end contact section -->
</asp:Content>
