<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" Runat="Server">
    <main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">Welcome to My Home Real Estate</h1>
      <p class="lead text-muted">We have a greate list of beautiful houses for sale in the Richmond and Columbia county area. Please click on the dropdown menu below to filter by county.</p>
      <p>
          <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
              <asp:ListItem Value="Select a County" Selected="True"></asp:ListItem>
              <asp:ListItem Value="Richmond County">Richmond County</asp:ListItem>
              <asp:ListItem Value="Columbia County">Columbia County</asp:ListItem>
          </asp:DropDownList>
      </p>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row">
          <!--House No:1-->
          <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                  <img src="Images/House/house1rich.jpg" height="225" alt="Richmond county house no1" />
                  <div class="card-body">
                      <p class="card-text">Est:
                          d-body">
                      <p class="card-text">Est:
                          <asp:Label ID="lblHouse1Price" runat="server" Text="Price"></asp:Label><a class="infoIcon"><svg width="15px" height="15px" class="svg-inline--fa fa-info-circle fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"></path></svg></a></p>
                      <p class="card-text">Size-Sq:
                          <asp:Label ID="lblHouse1Area" runat="server" Text="Area"></asp:Label></p>
                      <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                              <asp:Button ID="btn1Details" CommandArgument="1" runat="server" Text="Details" CssClass="btn btn-sm btn-outline-secondary" OnCommand="btnDetails_Click" />
                          </div>
                          <small class="text-muted">Richmond County District</small>
                      </div>
                  </div>
              </div>
          </div>
                  <!--House No:2-->
          <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                  <img src="Images/House/house2rich.jpg" height="225" alt="Richmond county house no1" />
                  <div class="card-body">
                      <p class="card-text">Est:
                          <asp:Label ID="lblHouse2Price" runat="server" Text="Price"></asp:Label><a class="infoIcon"><svg width="15px" height="15px" class="svg-inline--fa fa-info-circle fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"></path></svg></a></p>
                      <p class="card-text">Sq ft:
                          <asp:Label ID="lblHouse2Area" runat="server" Text="Area"></asp:Label></p>
                      <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                              <asp:Button ID="btn2Details" CommandArgument="2" runat="server" Text="Details" CssClass="btn btn-sm btn-outline-secondary" OnCommand="btnDetails_Click" />
                          </div>
                          <small class="text-muted">Richmond County District</small>
                      </div>
                  </div>
              </div>
          </div>
          <!--House No:3-->
          <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                  <img src="Images/House/house3rich.jpg" height="225" alt="Richmond county house no1" />
                  <div class="card-body">
                      <p class="card-text">Est:
                          <asp:Label ID="lblHouse3Price" runat="server" Text="Price"></asp:Label><a class="infoIcon"><svg width="15px" height="15px" class="svg-inline--fa fa-info-circle fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"></path></svg></a></p>
                      <p class="card-text">Sq ft:
                          <asp:Label ID="lblHouse3Area" runat="server" Text="Area"></asp:Label></p>
                      <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                              <asp:Button ID="btn3Details" CommandArgument="3" runat="server" Text="Details" CssClass="btn btn-sm btn-outline-secondary" OnCommand="btnDetails_Click" />
                          </div>
                          <small class="text-muted">Richmond County District</small>
                      </div>
                  </div>
              </div>
          </div>

          <!--House No:3-->
          <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                  <img src="Images/House/house4col.jpg" height="225" alt="Richmond county house no1" />
                  <div class="card-body">
                      <p class="card-text">Est:
                          <asp:Label ID="lblHouse4Price" runat="server" Text="Price"></asp:Label><a class="infoIcon"><svg width="15px" height="15px" class="svg-inline--fa fa-info-circle fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"></path></svg></a></p>
                      <p class="card-text">Sq ft:
                          <asp:Label ID="lblHouse4Area" runat="server" Text="Area"></asp:Label></p>
                      <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                              <asp:Button ID="btn4Details" CommandArgument="3" runat="server" Text="Details" CssClass="btn btn-sm btn-outline-secondary" OnCommand="btnDetails_Click" />
                          </div>
                          <small class="text-muted">Columbia County District</small>
                      </div>
                  </div>
              </div>
          </div>
          <!--House No:3-->
          <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                  <img src="Images/House/house5col.jpg" height="225" alt="Richmond county house no1" />
                  <div class="card-body">
                      <p class="card-text">Est:
                          <asp:Label ID="lblHouse5Price" runat="server" Text="Price"></asp:Label><a class="infoIcon"><svg width="15px" height="15px" class="svg-inline--fa fa-info-circle fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"></path></svg></a></p>
                      <p class="card-text">Sq ft:
                          <asp:Label ID="lblHouse5Area" runat="server" Text="Area"></asp:Label></p>
                      <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                              <asp:Button ID="btn5Details" CommandArgument="5" runat="server" Text="Details" CssClass="btn btn-sm btn-outline-secondary" OnCommand="btnDetails_Click" />
                          </div>
                          <small class="text-muted">Columbia County District</small>
                      </div>
                  </div>
              </div>
          </div>
                  <!--House No:3-->
          <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                  <img src="Images/House/house6col.jpg" height="225" alt="Richmond county house no1" />
                  <div class="card-body">
                      <p class="card-text">Est:
                          <asp:Label ID="lblHouse6Price" runat="server" Text="Price"></asp:Label><a class="infoIcon"><svg width="15px" height="15px" class="svg-inline--fa fa-info-circle fa-w-16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm0 110c23.196 0 42 18.804 42 42s-18.804 42-42 42-42-18.804-42-42 18.804-42 42-42zm56 254c0 6.627-5.373 12-12 12h-88c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h12v-64h-12c-6.627 0-12-5.373-12-12v-24c0-6.627 5.373-12 12-12h64c6.627 0 12 5.373 12 12v100h12c6.627 0 12 5.373 12 12v24z"></path></svg></a></p>
                      <p class="card-text">Sq ft:
                          <asp:Label ID="lblHouse6Area" runat="server" Text="Area"></asp:Label></p>
                      <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                              <asp:Button ID="btn6Details" CommandArgument="6" runat="server" Text="Details" CssClass="btn btn-sm btn-outline-secondary" OnCommand="btnDetails_Click" />
                          </div>
                          <small class="text-muted">Columbia County District</small>
                      </div>
                  </div>
              </div>
          </div>
      </div>
    </div>
  </div>
</main>
</asp:Content>

