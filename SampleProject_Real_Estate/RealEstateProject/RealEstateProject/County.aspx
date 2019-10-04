<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="County.aspx.cs" Inherits="County" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" Runat="Server">

        <main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">Houses from the <%:county%> District</h1>
      <p class="lead text-muted">We have a greate list of beautiful houses for sale in Richmond County. </p>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row">
          <!--House No:1-->
          <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                  <img src="<%:house1ImageUrl%>" height="225" alt="Richmond county house no1" />
                  <div class="card-body">
                      <p class="card-text">Est:
                          <asp:Label ID="lblHouse1Price" runat="server" Text="Price"></asp:Label><a class="infoIcon"><svg onmouseover="display(this)" width="15px" height="15px" class="svg-inline--fa fa-info-circle fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"></path></svg></a></p>
                      <p class="card-text">Size-Sq:
                          <asp:Label ID="lblHouse1Area" runat="server" Text="Area"></asp:Label></p>
                      <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                              <asp:Button ID="btn1Details" CommandArgument="1" runat="server" Text="Details" CssClass="btn btn-sm btn-outline-secondary" OnCommand="btnDetails_Click" />
                          </div>
                          <small class="text-muted"><asp:Label ID="lblHouse1Location" runat="server" Text="Label"></asp:Label></small>
                      </div>
                  </div>
              </div>
          </div>
          <!--House No:2-->
          <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                  <img src="<%:house2ImageUrl%>" height="225" alt="Richmond county house no1" />
                  <div class="card-body">
                      <p class="card-text">Est:
                          <asp:Label ID="lblHouse2Price" runat="server" Text="Price"></asp:Label><a class="infoIcon"><svg onmouseover="display(this)" width="15px" height="15px" class="svg-inline--fa fa-info-circle fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"></path></svg></a></p>
                      <p class="card-text">Sq ft:
                          <asp:Label ID="lblHouse2Area" runat="server" Text="Area"></asp:Label></p>
                      <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                              <asp:Button ID="btn2Details" CommandArgument="2" runat="server" Text="Details" CssClass="btn btn-sm btn-outline-secondary" OnCommand="btnDetails_Click" />
                          </div>
                          <small class="text-muted"><asp:Label ID="lblHouse2Location" runat="server" Text="Label"></asp:Label></small>
                      </div>
                  </div>
              </div>
          </div>
          <!--House No:3-->
          <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                  <img src="<%:house3ImageUrl%>" height="225" alt="Richmond county house no1" />
                  <div class="card-body">
                      <p class="card-text">Est:
                          <asp:Label ID="lblHouse3Price" runat="server" Text="Price"></asp:Label><a class="infoIcon"><svg onmouseover="display(this)" width="15px" height="15px" class="svg-inline--fa fa-info-circle fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"></path></svg></a></p>
                      <p class="card-text">Sq ft:
                          <asp:Label ID="lblHouse3Area" runat="server" Text="Area"></asp:Label></p>
                      <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                              <asp:Button ID="btn3Details" CommandArgument="3" runat="server" Text="Details" CssClass="btn btn-sm btn-outline-secondary" OnCommand="btnDetails_Click" />
                          </div>
                          <small class="text-muted"><asp:Label ID="lblHouse3Location" runat="server" Text="Label"></asp:Label></small>
                      </div>
                  </div>
              </div>
          </div>

      </div>
    </div>
  </div>
</main>


</asp:Content>

