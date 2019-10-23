<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 14: Product Receipt</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" alt="Halloween Store" />
    </header>
    <section>
        <form id="form1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProductID" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" 
                        SortExpression="ProductID">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OnHand" HeaderText="On Hand" SortExpression="OnHand">
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" Width="100px" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#E3EAEB" />
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#8FBC8F" />
                <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
                SelectCommand="SELECT ProductID, Name, OnHand FROM Products" 
                UpdateCommand="UPDATE Products SET OnHand = @OnHand WHERE (ProductID = @ProductID)">
                <UpdateParameters>
                    <asp:Parameter Name="OnHand" />
                    <asp:Parameter Name="ProductID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <p>
                <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
            </p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                HeaderText="Please correct the following errors:" CssClass="error" />
        </form>
    </section>
</body>
</html>
