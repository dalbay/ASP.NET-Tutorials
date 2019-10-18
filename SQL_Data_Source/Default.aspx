<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 13: Enhanced Product List</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
    <form id="form1" runat="server">
	
        <label>Choose a state:&nbsp;</label>
		
		<!--Drop-Down List for States-->
        <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True"
           DataSourceID="SqlDataSource3" DataTextField="StateName" DataValueField="StateCode">
        </asp:DropDownList>
		<!--Data Source for the States DDL-->
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateName]">
        </asp:SqlDataSource>
		
        <asp:DataList ID="dlCustomers" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource4" GridLines="Both">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <asp:Label ID="Label1" runat="server" Text="First Name" Width="175px"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Last Name" Width="175px"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="Email" Width="250px"></asp:Label>
            </HeaderTemplate>
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>' Width="175px"></asp:Label>
                <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>' Width="175px"></asp:Label>
                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>' Width="250px"></asp:Label>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
		
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" SelectCommand="SELECT [LastName], [FirstName], [Email] FROM [Customers] WHERE ([State] = @State) ORDER BY [LastName], [FirstName] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlState" DefaultValue="" Name="State" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
<!----------------------------------------------------------------------------->
        <label>Choose a category:&nbsp;</label>
        <asp:DropDownList ID="ddlCategory" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="LongName" 
            DataValueField="CategoryID" AutoPostBack="True">
        </asp:DropDownList><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            SelectCommand="SELECT [CategoryID], [LongName] FROM [Categories] 
                ORDER BY [LongName]">
        </asp:SqlDataSource>
        <asp:DataList ID="dlProducts" runat="server" DataKeyField="ProductID" 
            DataSourceID="SqlDataSource2" CellPadding="4">
            <AlternatingItemStyle BackColor="#E3EAEB" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <table>
                    <tr>
                        <td class="col1">ID</td>
                        <td class="col2">Product</td>
                        <td class="col3">Unit Price</td>
                        <td class="col4">On Hand</td>
                        <td class="col4">Total</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td class="col1">
                            <asp:Label ID="lblID" runat="server" Text='<%# Eval("ProductID") %>' />
                        </td>
                        <td class="col2">
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' />
                        </td>
                        <td class="col3">
                            <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("UnitPrice", "{0:C}") %>' />
                        </td>
                        <td class="col4">
                            <asp:Label ID="lblOnHand" runat="server" Text='<%# Eval("OnHand") %>' />
                        </td>
                        <td class="col4">
                            <asp:Label ID="lblTotal" runat="server" Text='<%# Eval("Total", "{0:C}") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
            SelectCommand="SELECT ProductID, Name, UnitPrice, OnHand, UnitPrice * OnHand AS Total FROM Products WHERE (CategoryID = @CategoryID) ORDER BY ProductID">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" 
                 PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    </section>
</body>
</html>
