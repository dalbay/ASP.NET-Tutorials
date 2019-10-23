# ASP.NET - Tutorials


## GridView Control

### How to Customize the GridView Control
- drag and drop the gridview control from the data group of the ***Toolbox***
- data is rendered as an HTML table
- to bind a gridview control to a data source, use the smart tag menu's ***Choose Data Source*** command.
- basic properties of the gridview control:
  - ***DataSourceID*** - the ID of the data source to bind to.
  - ***DataKeyNames*** - the names of the primary key columns separated by commas.
  - ***AutoGenerateColumns*** - specifies whether the control's columns should be automatically generated.
  - ***SelectedIndex*** - specifies the row to be initially selected.
- by default, the gridview control displays one column for each column in the data source.
- to define the field that you want to display in the gridview control, display the ***Fields*** dialog box by selecting the ***Edit Columns*** command from the control's smart tag menu. 
- another way to add a field to a gridview control is to use the ***Add New Column*** command in the smart tag menu.
![GridView Fields](/images/gridviewImg1.png)
- commonly used ***Field Properties***:
  - DataField
  - DataFormatString
  - ItemStyle.Width
  - ReadOnly
  - NullDisplayText
  - ConvertEmptyStringToNull
  - HeaderText
  - ShowHeader
#### Elements used to Create and Format Fields:
- the gridview control uses several child elements to define the column fields in a row and the style used to format the data.
- ***Column Field Elements***:
  - Columns - the columns that are displayed by a gridview control
  - asp:BoundField - a field bound to a data source column
  - asp:ButtonField - a field that displays a button
  - asp:CheckBoxField - a field that displays a check box
  - asp:CommandField - a field that contains Select, Edit, Delete, Update, or Cancel buttons
  - asp:HyperlinkField - a field that displays a hyperlink
  - asp:ImageField - a field that displays an image
  - asp:TemplateField - Lets you create a column with custom content
- ***Style Elements*** :
  - RowStyle 
  - AlternatingRowStyle
  - SelectedRowStyle
  - EditRowStyle
  - EmptyDataRowStyle
  - ItemStyle
  - HeaderStyle
  - FooterStyle
  - PagerStyle
#### How to use Bootstrap CSS classes
- since ASP.NET renders a gridview control as an HTML table, you can use the Bootstrap CSS classes for HTML tables to style GridView controls.
- for the Bootstrap table classes to be applied properly, an HTML table must have thead and tbody elements. Because ASP.NET doesn't render these elements for a gridview control by default, you must add code to the control's ***PreRender*** event that sets the value of the control's ***HeaderRow*** property to ***TableHeader***.
![GridView Bootstrap](/images/gridviewImg2.png)
The ***PreRender event handler*** for the GridView Control:  
```C#
	protected void grdCategories_PreRender(object sender,
		EventArgs e)
	{
		if (grdCategories.HeaderRow != null)
			grdCategories.HeaderRow.TableSection =
				TableRowSection.TableHeader;
	}
```
#### How to enable Sorting
- to enable sorting, set the ***AllowSorting*** property to True. Then, add a ***SortExpression*** property to each column you want to allow sorting for. 
- for sorting to work, the ***DataSourceMode*** property of the data source must be set to ***DataSet*** mode, which is by default.
![GridView Sorting](/images/gridviewImg3.png)
#### How to enable Paging
- to enable paging, set the ***AllowPaging*** property to True. Then, add a ***PagerStyle*** element to define the appearance of the pager controls. You can also add a ***PagerSettings*** element.
- for paging to work, the ***DataSourceMode*** property of the data source must be set to ***DataSet*** mode, which is by default.  
```ASP.NET
	<asp:GridView ID="GridView1" runat="server" AllowPaging="true"
		AutoGenerateColumns="False" DataKeyNames="CategoryID"
		DataSourceID="SqlDataSource1" UseAccessibleHeader="true" 
		CssClass="table table-bordered table-striped table-condensed"
		OnPreRender="GridView1_PreRender">
		<Columns>
			<asp:BoundField DataField="ProductID" HeaderText="ID" 
				ReadOnly="True">
				<ItemStyle CssClass="col-xs-1" />
			</asp:BoundField>
			<asp:BoundField DataField="Name" HeaderText="Name">
				<ItemStyle CssClass="col-xs-4" />
			</asp:BoundField>
			<asp:BoundField DataField="CategoryID"
				HeaderText="Category"> 
				<ItemStyle CssClass="col-xs-2" />
			</asp:BoundField>
			<asp:BoundField DataField="UnitPrice"
				HeaderText="Unit Price" DataFormatString="{0:c}">
				<ItemStyle CssClass="col-xs-2 text-right" /> 
				<HeaderStyle CssClass="text-right" />
			</asp:BoundField>
			<asp:BoundField DataField="OnHand" HeaderText="On Hand"> 
				<ItemStyle CssClass="col-xs-2 text-right" />
				<HeaderStyle CssClass="text-right" />
			</asp:BoundField>
		</Columns>
		<PagerStyle CssClass="pagerStyle" HorizontalAlign="Center" />
	</asp:GridView>
```
- ***Properties*** of the GridView Control that ***affect paging***:
  - AllowPaging - Set to True to enable paging.
  - PageSize - Specifies the number of rows to display on each page. The default is 10. 
- Properties of the ***PagerSettings*** element:
  - Mode - controls what buttons are displayed in the pager area
  - FirstPageText - the text to display for the first page button. the default is &lt;&lt; which displays as <<
  - FirstPageImageUrl 
  - PreviousPageText
  - PreviousPageImageUrl
  - NextPageText
  - NextPageImageUrl
  - LastPageText
  - LastPageImageUrl
  - PageButtonCount
  - Position
  - Visible
#### Example - A PagerSettings element:
```ASP.NET
	<PagerSettings Mode="NextPreviousFirstLast" 
				   NextPageText="Next"
				   PreviousPageText="Prev"
				   FirstPageText="First"
				   LastPageText="Last" />
```  
The resulting pager area:
![GridView Paging](/images/gridviewImg4.png)
#### Example: A list application that uses a GridView control:
```ASP
<body>
<div class="container">
	<header class="jumbotron"><%-- image set in site.css --%>
	</header>
	<main class="row">
	<form id="form1" runat="server">
		<div class="col-xs-12 table-responsive">
			<asp:GridView ID="grdProducts" runat="server" 
				AutoGenerateColumns="False" DataKeyNames="ProductID" 
				DataSourceID="SqlDataSource1" AllowPaging="True"
				PageSize="8" AllowSorting="True" 
				CssClass="table table-bordered table-striped
				table-condensed" 
				OnPreRender="grdProducts_PreRender">
				<Columns>
					<asp:BoundField DataField="ProductID"
						HeaderText="ID" ReadOnly="True"
						SortExpression="ProductID">
						<ItemStyle CssClass="col-xs-1" />
					</asp:BoundField>
					<asp:BoundField DataField="Name"
						HeaderText="Name" SortExpression="Name">
						<ItemStyle CssClass="col-xs-4" />
					</asp:BoundField>
					<asp:BoundField DataField="CategoryID"
						HeaderText="Category"
						SortExpression="CategoryID, Name">
						<ItemStyle CssClass="col-xs-2" />
					</asp:BoundField>
					<asp:BoundField DataField="UnitPrice"
						HeaderText="Unit Price"
						DataFormatString="{0:c}">
						<ItemStyle CssClass="col-xs-2 text-right" />
						<HeaderStyle CssClass="text-right" />
					</asp:BoundField>
					<asp:BoundField DataField="OnHand"
						HeaderText="On Hand">
						<ItemStyle CssClass="col-xs-2 text-right" />
						<HeaderStyle CssClass="text-right" />
					</asp:BoundField>
				</Columns>
				<HeaderStyle CssClass="bg-halloween" />
				<PagerSettings Mode="NumericFirstLast" />
				<PagerStyle CssClass="pagerStyle"
				   BackColor="#8C8C8C"
				   HorizontalAlign="Center" />
			</asp:GridView>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
				ConnectionString=
					"<%$ ConnectionStrings:HalloweenConnection %>" 
				SelectCommand="SELECT [ProductID], [Name],
					[CategoryID], [UnitPrice], [OnHand]
					FROM [Products]">
			</asp:SqlDataSource>    
		</div>  
	</form>
	</main>
</div>
</body>
```  
The event handler for the PreRender event of the GridView control:
```C#
	protected void grdProducts_PreRender(object sender,
		EventArgs e)
	{
		grdProducts.HeaderRow.TableSection =
			TableRowSection.TableHeader;
	}
```  
![GridView Example](/images/gridviewImg5.png)
<br/>




