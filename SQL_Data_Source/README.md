# ASP.NET - Tutorials

### SQL Data Source Control

- A **SqlDataSource** control provides the information an application needs to connect to a database and retrieve the data needed by the application. It can also be used to insert, update, and delete data.
- A SQL data source can be bound to another control, such as a drop down list or a DataList control. Then, the data that's retrieved by the data source is displayed in that control.  
- The data source type is Database by default; you can change it to Entity, LINQ, Object, Site Map, and XML File
- You can choose from a previously created connection for a database; or create a new connection.
- ASP.NET applications can store connection strings in the Web.config file. If you save the connection string in the Web.config file, the ConnectionString property of the data source control will include a special code that retrieves the connection string from the Web.config file.
```ASP
  <connectionStrings>
    <add name="HalloweenConnection" connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Halloween.mdf;Integrated Security=True"
      providerName="System.Data.SqlClient" />
  </connectionStrings>
```
- Define a Select statement in the dialog box.
- When you create a WHERE clause, the wizard creates one or more select parameters that provide the values used by the WHERE clause. Each SqlDataSource control that includes select parameters is defined by a SqlDataSource element that includes a child element named SelectParameters. 
```ASP
	<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
		ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
		SelectCommand="SELECT [ProductID], [UnitPrice], [Quantity], [Extension] 
		FROM [LineItems] WHERE ([InvoiceNumber] = @InvoiceNumber)">
		<SelectParameters>
			<asp:ControlParameter ControlID="ddlInvoice" Name="InvoiceNumber" 
				PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>
```

### DataList Control
- A **data list** displays a list of items from the data source that it's bound to. To bind a data list to a data source, use the Choose Data Source command in the control's smart tag menu.
- To define the infromation to be displayed in a data list, you create one or more templates. VS provides a designer interface.
- To display the data from a column in the data source in a data list, you add a control to a template and then bind that control.
- You can use a DataList control for edit operations as well as diplay operations. However, you're more likely to use the GridView, DetailsView, FormView, and ListView control for edit operations.
```ASP
	<asp:DataList ID="dlLineItems" runat="server" DataSourceID="SqlDataSource2"
		CssClass="table table-bordered table-striped table-condensed">
		<HeaderTemplate>
			<span class="col-xs-3">Product</span>
			<span class="col-xs-3 text-right">Unit Price</span>
			<span class="col-xs-3 text-right">Quantity</span>
			<span class="col-xs-3 text-right">Extension</span>
		</HeaderTemplate>
		<ItemTemplate>
			<asp:Label ID="ProductIDLabel" runat="server" 
				Text='<%# Eval("ProductID") %>' CssClass="col-xs-3" />
			<asp:Label ID="UnitPriceLabel" runat="server" 
				Text='<%# Eval("UnitPrice", "{0:C}") %>' CssClass="col-xs-3 text-right" />
			<asp:Label ID="QuantityLabel" runat="server" 
				Text='<%# Eval("Quantity") %>' CssClass="col-xs-3 text-right" />
			<asp:Label ID="ExtensionLabel" runat="server" 
				Text='<%# Eval("Extension", "{0:C}") %>' CssClass="col-xs-3 text-right" />
		</ItemTemplate>
		<HeaderStyle CssClass="bg-halloween" />
	</asp:DataList>
```

### Data Binding
- You can bind any of the controls that inherit the ListControl class to a data source; List box control, drop-down list control, check box list control, radio button list control.
- You can use the Data Source Configuration Wizard to select the data source for a list control. 
- You can also use the DataTextFormatString property of a list control to specify a format string. 
- To bind a control in a template, select the Edit DataBindings command from the smart tag menu for the control to display the DataBindings dialog box. Then, select the property you want to bind to (usually Text).
- The Eval method provides only for displaying data from a data source in a control. In contrast, the Bind method provides for two-way binding, which means that it can be used to display as well as update data from a data source.  
```ASP
<%# Eval("Name") %>
<%# Bind("UnitPrice", "{0:C}") %>
```
---