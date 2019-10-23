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
![GridView Fields](images/gridviewImg1.png)
- commonly used field properties:
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
- ***Column field elements***:
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








