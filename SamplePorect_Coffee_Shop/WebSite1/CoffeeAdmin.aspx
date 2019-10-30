<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CoffeeAdmin.aspx.cs" Inherits="CoffeeAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row">
                        <nav class="col-sm-3 col-md-2 hidden-xs-down bg-faded sidebar">
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Overview<span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Daily Sales Reports</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Monthly Sales Reports</a>
                            </li>
                        </ul>
                            <ul class="nav nav-pills flex-column">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Other Items</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Discount Coupons</a>
                                </li>
                            </ul>
                    </nav>


    <main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
        <h1>Bombastic Cafe Admin</h1>

        <section class="row text-center">
            <div class="col-6 col-sm-3">
                <h4>COFFEE-Type</h4>
                <p>List of the coffees we have to offer:</p>
                <p>*Espresso</p>
                <p>*Espresso Medio</p>
                <p>Midnight Oil </p>
                <p>Java Estate Blend</p>
                <p>Columbian Supremo</p>
                <p>Costa Rica Natural</p>
                <div class="text-muted">(*)Not available in all sizes.</div>
            </div>
            <div class="col-6 col-sm-3">
                <h4>Characteristics</h4>
                <p>List of the Coffee flavors we have to offer:</p>
                <p>Light Roasted</p>
                <p>*Decaffeinated</p>
                <p>Organic</p>
                <p>Dark Roasted</p>
                <div class="text-muted">Note: Espresso light roasted!</div>
            </div>
            <div class="col-6 col-sm-3">
                <h4>Size</h4>
                <p>List of the Cup sizes we offer:</p>
                <p>Small</p>
                <p>*Regular</p>
                <p>Large</p>
                <div class="text-muted">Regular size is also considered Medium</div>
            </div>
            <div class="col-6 col-sm-3">
                <h4>Price</h4>
                <p>Pricing policy changes depending on the season.</p>
                <p>Spring-Summer Season -$0.05-0.10 for large sizes only</p>
                <p>*Halloween Specials +0.10 per cup/any size</p>
                <p>Winter regular pricing</p>
                <div class="text-muted">Season make up +2 unique flavors.</div>
            </div>
        </section>
        <section class="row text-center"; style="background-color: antiquewhite; margin-top: 20px;">
        <h2>Coffee Chart - (MENU)</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CoffeeAppConnectionString3 %>" DeleteCommand="DELETE FROM [coffee] WHERE [id] = @id" InsertCommand="INSERT INTO [coffee] ([name], [type], [size], [price]) VALUES (@name, @type, @size, @price)" SelectCommand="SELECT * FROM [coffee]" UpdateCommand="UPDATE [coffee] SET [name] = @name, [type] = @type, [size] = @size, [price] = @price WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="size" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="size" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            <div class="col-lg-1"></div>
                <div class="col-lg-10 table-responsive" style="margin-bottom: 20px;">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped table-condensed"  AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" ForeColor="Black" GridLines="Vertical" Width="795px" OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Number" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="name" HeaderText="COFFEE" SortExpression="name" />
                    <asp:BoundField DataField="type" HeaderText="Characteristics" SortExpression="type" />
                    <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" />
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" DataFormatString="{0:C}" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
                    <asp:Label ID="lblError" runat="server" ForeColor="#CC3300"></asp:Label>
</div>
            <div class="col-lg-1"></div> 
        </section>
        <section class="row text-center"; style="background-color: antiquewhite; margin-top: 20px;">

        </section>
    </main>
    </div>
</asp:Content>



