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
            <form action="#">
              <div class="contact_form-container">
                <div>
                  <div>
                    <input type="text" placeholder="Name">
                  </div>
                  <div>
                    <input type="text" placeholder="Phone Number">
                  </div>
                  <div>
                    <input type="email" placeholder="Email">
                  </div>
                  <div class="">
                    <input type="text" placeholder="Message" class="message_input">
                  </div>
                  <div class="mt-5 d-flex justify-content-center ">
                    <button type="submit">
                      Send
                    </button>
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
