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
// When ClientIDMode is Predictable
	<select name="ctl00$mainPlaceHolder$lstCart" id="mainPlaceHolder_lstCart">...</select>
// When ClientIDMode is Static
	<select name="ctl00$mainPlaceHolder$lstCart" id="lstCart">...</select>
// When ClientIDMode is AutoID
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


