<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="County" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" Runat="Server">
       <main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">Welcome to My Home Real Estate</h1>
      <p class="lead text-muted">We have a greate list of beautiful houses for sale in the Richmond and Columbia county area. Please click on the dropdown menu below to filter by county.</p>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">

        <div class="row">
            <!--House No:1-->
            <div class="col-md-8">
                <div class="card mb-8 shadow-sm">
                    <img src="<%:imageUrl%>" height="450" alt="House For Sale Image" />
                </div>
                <div class="card mb-8 shadow-sm">
                    <p><span class="houseProps">Price :</span><asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label></p>
                    <p><span class="houseProps">Area : </span><asp:Label ID="lblArea" runat="server" Text="Label"></asp:Label></p>
                    <p><span class="houseProps">Location : </span><asp:Label ID="lblLocation" runat="server" Text="Label"></asp:Label></p>
                    <p><span class="houseProps">Heating & AC : </span><asp:Label ID="lblAC" runat="server" Text="Label"></asp:Label></p>
                    <p><span class="houseProps">Year Build :</span><asp:Label ID="lblBuildYear" runat="server" Text="Label"></asp:Label></p>
                    <p><span class="houseProps">Description :</span> <asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label></p>

                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <img src="<%:image2Url%>" height="200" alt="Kitchen image" />
                    <img src="<%:image3Url%>" style="margin-top:50px" height="200" alt="Living Room Image" />
                </div>
            </div>
        </div>
    </div>
  </div>
</main>
</asp:Content>

