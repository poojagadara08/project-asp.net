﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Glasses.aspx.cs" Inherits="WebApplication3.Glasses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- quality section -->

  <section class="quality_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h2>
          <span> Best</span> Quality
        </h2>
      </div>
      <div class="row">
        <div class="col-md-6">
          <ul class="nav nav-tabs detail-box" id="myTab" role="tablist">
            <li class="">
              <a class=" active" id="QTab1Link" data-toggle="tab" href="#qTab1" role="tab" aria-controls="qTab1" aria-selected="true">
                <h6 id="" data-toggle="tab" href="#qTab1" role="tab" aria-controls="qTab1" aria-selected="true">
                  <span>01</span>
                  It is a long established fact that a reader will be distracted
                </h6>
              </a>
            </li>
            <li class="">
              <a class="" id="QTab2Link" data-toggle="tab" href="#qTab2" role="tab" aria-controls="qTab2" aria-selected="false">
                <h6 id="" data-toggle="tab" href="#qTab2" role="tab" aria-controls="qTab2" aria-selected="false">
                  <span>02</span>
                  by the readable content of a page when looking at its
                </h6>
              </a>
            </li>
            <li class="">
              <a class="" id="QTab3Link" data-toggle="tab" href="#qTab3" role="tab" aria-controls="qTab3" aria-selected="false">
                <h6 id="" data-toggle="tab" href="#qTab3" role="tab" aria-controls="qTab3" aria-selected="false">
                  <span>03</span>
                  layout. The point of using Lorem Ipsum is that it has a
                </h6>
              </a>
            </li>
            <li class="">
              <a class="" id="QTab4Link" data-toggle="tab" href="#qTab4" role="tab" aria-controls="qTab4" aria-selected="false">
                <h6 id="" data-toggle="tab" href="#qTab4" role="tab" aria-controls="qTab4" aria-selected="false">
                  <span>04</span>
                  more-or-less normal distribution of letters,
                </h6>
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-6 tab-content">
          <div class="img-container tab-pane  fade show active" id="qTab1" role="tabpanel" aria-labelledby="QTab1Link">
            <div class="img-box ">
              <img src="images/quality-img.jpg" alt="">
            </div>
          </div>
          <div class="img-container tab-pane fade" id="qTab2" role="tabpanel" aria-labelledby="QTab2Link">
            <div class="img-box  ">
              <img src="images/buy-img.png" alt="">
            </div>
          </div>
          <div class="img-container tab-pane fade" id="qTab3" role="tabpanel" aria-labelledby="QTab3Link">
            <div class="img-box  ">
              <img src="images/quality-img.jpg" alt="">
            </div>
          </div>
          <div class="img-container tab-pane fade" id="qTab4" role="tabpanel" aria-labelledby="QTab4Link">
            <div class="img-box  ">
              <img src="images/buy-img.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


  <!-- end quality section -->

  <!-- offer section -->

  <section class="offer_section">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-7 px-0">
          <div class="img-box">
            <img src="images/offer-img.jpg" alt="">
            <div class="price">
              <h4>
                $60
              </h4>
            </div>
          </div>
        </div>
        <div class="col-md-4 offset-md-1">
          <div class="detail-box">
            <h2>
              Book <br>
              our <br>
              special <br>
              offer
            </h2>
            <a href="#">
              See More offer
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>


  <!-- end offer section -->

  <!-- buy section -->

  <section class="buy_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h2>
          <span class="s-1">
            Buy
          </span>
          your stylish
          <span class="s-2">
            glasses
          </span>
        </h2>
      </div>
      <div class="box">
        <div class="img-box">
          <img src="images/buy-img.png" alt="">
        </div>
        <div class="detail-box">
          <p>
            It is a long established fact that a reader will be distracted by the readable content of a page when
            looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of
            letters, <br>
            It is a long established fact that a reader will be distracted by the readable content of a page when
            looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of
            letters,
          </p>
          <a href="#">
            Book Now
          </a>
        </div>
      </div>
    </div>
  </section>

  <!-- end buy section -->

  <!-- client section -->

  <section class="client_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container">
        <h2>
          <span> What </span> Says Our Cutomer
        </h2>
      </div>
      <div class="box">
        <div class="detail-box">
          <p>
            There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in
            some form, by injected humour, or randomised words which don't look even slightly believable.There are many
            variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by
            injected humour, or randomised words which don't look even slightly believable.
          </p>
        </div>
        <div class="client-id">
          <div class="img-box">
            <img src="images/client.png" alt="">
          </div>
          <h5>
            Jacksmith sand
          </h5>
        </div>
      </div>
    </div>
  </section>

  <!-- end client section -->
</asp:Content>
