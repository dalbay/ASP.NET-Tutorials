# ASP.NET - Tutorials


## Master Pages

### How to Create a Master Page
• Right-click on the project in the Solution Explorer  
• Select Add -> Web Forms Master Page, enter a name for the page in the resulting dialog box, and click OK. A new master page with two content placeholder controls, but you can add more:
```HTML
<%@ Master Language="C#" AutoEventWireup="true" CodeBehind="Site.master.cs" Inherits="Ch09Cart.Site" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<asp:ContentPlaceHolder id="head" runat="server">
	</asp:ContentPlaceHolder>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<asp:ContentPlaceHolder id="ContentPlaceHolder1" 
			runat="server">
		</asp:ContentPlaceHolder>
	</div>
	</form>
</body>
</html>
```  
***How to Work with the ClientIDMode attribute :***  
- **Cliend id** - the id attribute that ASP.NET  assigns to an HTML element when it renders HTML to the browser.  


For example, a list box with an ID of "1stCart" will be rendered as a select element with an id of "1stCart".
<br/>

However, if a server control is placed inside a parent control, such as a ContentPlaceHolder control, ASP.NET uses a combination of the parent control's ID and the server control's ID to create the client id.
<br/>

You can see how this can be a problem if your CSS expects the id to be "1stCart" but ASP.NET generates an id of "mainPlaceHolder_1stCart".
<br/>

The good news is that you can control how a client id is created by using the ClientIDMode attribute of a page or a control.  
*When to change the page's ClientIDMode attribute:* when you're converting existing pages s othey use a master page and you've already written the CSS for them.  

Values of the ClientIDMode attribute

|  Value     | Description  |
|----------- | -------------|
|Predictable  |  the client id is the name of the parent container added to the name of the server control | 
|Static  |  The client id is the same as the server control id. This can cause id conflicts, such as when there are several instances of the same user control on a page  |
| AutoID  |  The client id is based on the conventions of ASP.NET versions prior to 4.0  |
| Inhert  |  The control inherits the parent's ClientIDMode. This is the default value for a control.  |
<br/>

***Example:*** The select elements generated for a list box:
```HTML
<!--When ClientIDMode is Predictable-->
	<select name="ctl00$mainPlaceHolder$lstCart" id="mainPlaceHolder_lstCart">...</select>
<!--When ClientIDMode is Static-->
	<select name="ctl00$mainPlaceHolder$lstCart" id="lstCart">...</select>
<!--When ClientIDMode is AutoID-->
	<select name="ctl00$mainPlaceHolder$lstCart" id="ctl00_mainPlaceHolder_lstCart">...</select>
```

### How to Create Content Pages
***Two ways to add a content page to a project:***  
• Right-click on the master page in the Solution Explorer, then choose Add Content Page. The new content page will be named WebFormnumber.aspx by default.  
• Right-click on the project in the Solution Explorer and select AddWeb Form with Master Page. Then, enter a name for the content page in the resulting dialog box and click OK. In the Select a Master Page dialog box that appears, select the master page you want to use and click OK.  
<br/>

***How to convert a regular ASP.NET page to a content page***  
• Add a MasterPageFile attribute to the Page directive and set its value to the URL of the master page.  
• Add one or more Content controls outside the html element. For each Content control, set its ContentPlaceHolderID attribute to the correct content placeholder of the master page. Then, move the original contents of the page inside the Content controls.  
• If the head element contains other elements the page needs, like link or script elements, add a Content control and set its ContentPlaceHolderID to the content placeholder that’s in the master page’s head element. Then, move the needed elements inside this control.  
• Delete everything that’s outside the Content controls except the Page directive.  
<br/>

***How to add content to a page***  
• To add content to a content page, you add text, HTML elements, or server controls to Source view or Design view, just as you would for any other page. Just be sure that what you add is within the right Content control.  
• When you display a content page in Design view, the elements from the master page are displayed, but you can't edit them.  
• If you're using Bootstrap to format your web page, the display in Design view probably won't look right.  
<br/>

***Example:***  
```HTML
	<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
		<asp:ListBox ID="lstCart" runat="server"></asp:ListBox>
		<asp:Button ID="btnRemove" runat="server" 
			Text="Remove Item" OnClick="btnRemove_Click"
			CssClass="btn" />
		<asp:Button ID="btnEmpty" runat="server" 
			Text="Empty Cart" OnClick="btnEmpty_Click"
			CssClass="btn" />
		...
	</asp:Content>
```  
<br/>

### How to Customize Content Pages  
To provide *default content* that can be overridden by a content page, add content to a placeholder in a master page. This content is overridden by the Content control that's generated for the placeholder when a new content page is created, but you can display the default content by deleting this Content control.  
<br/>

***How to set a default title in a master's page and override it in a content page***
```HTML
<!--Set the default title in master page, enter the content for the title element-->
	<title>Shopping Cart</title>
<!--override it in a content page, use the Title attribute of the Page directive-->
	<%@ Page Title="Your Shopping Cart" Language="C#" . . . %>
```  
***How to set default content in a master page***  
```HTML
	<asp:ContentPlaceHolder id="footerPlaceHolder" runat="server">
		<asp:Label ID="lblDaysUntilHalloween" runat="server"></asp:Label>
	</asp:ContentPlaceHolder>
```  
***How to display a placeholder's default content in a content page***  
• Delete the Content control associated with the placeholder that has the default content. You can do that manually or by choosing Default to Master's Content from the placeholder's smart tag menu.
<br/>

***How to override a placeholder's default content in a content page***  
• Add content to the Content control for the related placeholder that's added when you create the content page. If you've deleted a Content control, you can add a new one by choosing Create Custom Content from the placeholder's smart tag menu.
<br/>

***How to expose a public property in a master page***  
Another ways to provide content that can be overridden by a content page is to use *public properties*. For instance, you can use a public property for an h1 element that will be displayed at the top of every page. Then, the content page can override the value in this h1 element.  
```HTML
<!--The aspx code for the element in the master page-->
	<main class="col-sm-9">
		<h1><asp:Label ID="lblPageHeader" runat="server"></asp:Label></h1>
			<asp:ContentPlaceHolder ID="mainPlaceholder" runat="server"></asp:ContentPlaceHolder>
	</main>
```
```C#
// The C# in the code-behind file that exposes the property
	public string HeaderText 
	{
		set { lblPageHeader.Text = value;  }
	}
```  
***How to access a public property from a content page***  
To access a master page's public properties, a content page must have a MasterType directive with either a TypeName or VirtualPath attribute. The MasterType directive goes below the Page directive.  
```HTML
<!--The MasterType directive for a content page-->
	<%@ MasterType VirtualPath="~/Site.Master" %>
```
```C#
// The C# code in the code-behind file that accesses the public property
	Master.HeaderText = "Your Shopping Cart";
```  
---
<br/>

### Murach's Sample Tutorial -	Create a master page for the Reservation application

In this application, you’ll start by creating a master page for the Reservation application. Then, you’ll convert the Request and Confirm pages to content pages. The resulting pages, like the one that follows, should look and operate the same way they did before.
 
Create the master page
1.	Open the XEx09Reservation web application in your exercises_extra directory.
2.	Add a master page named Site.Master to the project and add “Chapter 9: Reservations” as the content of the title element in the head section.
3.	Change the ID for the placeholder in the form element to “mainPlaceHolder”. You can leave the ID for the placeholder in the head section as “head”.
4.	Move the viewport meta tag from the Request page to the head section of the master page. Then, move the link and script elements from the Request page into the head section of the master page.
5.	Assign the form element to the “form-horizontal” CSS class, and the div element to the “container” class. Then, move the header and footer elements from the Request page to locations inside the container div, above and below the placeholder control.
6.	Wrap the placeholder in the container div with a main element. At this point, the form in the body element should contain a div whose class is “container”, and this div should contain a header element, a main element that contains a placeholder, and a footer element.
7.	Display the code-behind file for the master page, and add code to the Load event handler for the page that sets the text of the label in the footer to the current year.
Convert the Request page to a content page
8.	Add a MasterPageFile attribute to the Page directive of the Request page that points to the site.master file.
9.	After the page directive, add a Content control that points to the main placeholder in the master page, and move all the contents of the form element into this control.
10.	Delete all other elements in the aspx for the page. At this point, there should be a Page directive and one Content control that contains the aspx code for the Request page.
11.	Display the code-behind file for the page, and remove the code in the Load event handler for the page that sets the copyright year. Then remove the private currentYear variable at the top of the page.
Test the Request page
12.	Run the application to see how everything is working. At this point, the Request page should look the way it did before the conversion.
13.	If there are any other problems, fix them.
Convert the Confirm page to a content page and test the entire application
14.	Convert the Confirm page to a content page in the same way that you converted the Request page.
15.	Test this page and fix any problems.
16.	Test the entire application to make sure that it works the same way that it did before.
Add a custom style sheet for the Confirmation page
17.	Add a style sheet named confirm.css to the Content folder. Add a rule set that changes the color of h3 elements to “darkslateblue”.
18.	Add a Content control to the Confirm.aspx page that points to the head placeholder in the master page. Then, drag the new style sheet to that content control.
19.	Run the application and see that the new style is applied to the Confirmation page.






