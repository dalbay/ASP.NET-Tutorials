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
        <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="StateName" DataValueField="StateCode">

        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateName]"></asp:SqlDataSource>
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
                            <asp:Label ID="lblID" runat="server" 
                                Text='<%# Eval("ProductID") %>' />
                        </td>
                        <td class="col2">
                            <asp:Label ID="lblName" runat="server" 
                                Text='<%# Eval("Name") %>' />
                        </td>
                        <td class="col3">
                            <asp:Label ID="lblUnitPrice" runat="server" 
                                Text='<%# Eval("UnitPrice", "{0:C}") %>' />
                        </td>
                        <td class="col4">
                            <asp:Label ID="lblOnHand" runat="server" 
                                Text='<%# Eval("OnHand") %>' />
                        </td>
                        <td class="col4">
                            <asp:Label ID="lblTotal" runat="server" Text='<%# Eval("Total", "{0:C}") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <AlternatingItemStyle BackColor="#E3EAEB" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
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
