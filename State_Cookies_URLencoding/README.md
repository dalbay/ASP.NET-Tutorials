# ASP.NET - Tutorials


## How to use View State
- View state provides for retaining the values of page and control properties that change from one execution of a page to another.
- Before ASP.NET sends a page back to the client, it determines what changes the program has made to the properties of the page and its controls.
- These changes are encoded in a string that’s assigned to the value of a hidden input field named **_VIEWSTATE**.
- When the page is posted back to the server, the _VIEWSTATE field is sent back to the server along with the HTTP request. Then, ASP.NET retrieves the property values from the _VIEWSTATE field and uses them to restore the page and control properties.
- ASP.NET also uses view state to save the values of the page properties it uses, such as IsPostBack.
- If view state is enabled for a data-bound control, the control will not be bound again when the page is reposted. Instead, the control's values will be restored from view state.

### How to disable view state
- For a control
  •	Set the control’s EnableViewState property to False. 
- For an entire page
  •	Set the EnableViewState property of the Page directive to False.
- For an entire application
  •	Set the EnableViewState attribute of the pages element in the system.web element of the Web.config file to False.

- View state is implemented with a view state object that's defined by the StateBag class. This class defines a collection of view state items.
### Common members of the StateBag class
| Properties    | Description   |
| ------------- |:-------------:| 
| Count         | Gets the number of StateItem objects in the StateBag object.|
| Keys          | Gets a collection of keys representing the items in the StateBag object.|
| Values        | Gets a collection of the view-state values stored in the StateBag object.|

| Methods             | Description   |
| ------------------- |:-------------:| 
| Add(String, Object) | Adds a new StateItem object to the StateBag object. If the item already exists in the StateBag object, this method updates the value of the item.|
| Clear() | Removes all items from the current StateBag object.|
| Remove(String) | 	Removes the specified key/value pair from the StateBag object.|

- A statement that adds or updates a view state item
```C#
	ViewState.Add("TimeStamp", DateTime.Now);
```
- Another way to add or update a view state item
```C#
	ViewState["TimeStamp"] = DateTime.Now;
```
- A statement that retrieves the value of a view state item
```C#
	DateTime timeStamp = (DateTime) ViewState["TimeStamp"];
```
- A statement that removes an item from view state
```C#
	ViewState.Remove("TimeStamp");
```
## How to use Session State
- ASP.NET uses session state to track the state of each user of an application.
- Session state objects are maintained in server memory by default.
### Common members of the HttpSessionState class
| Properties        | Description |
| ------------- |:-------------:| 
| SessionID | The unique id of the session|
| Count | The number of items in the session state collection |

| Methods        | Description |
| ------------- |:-------------:| 
| Add(String, Object) | Adds an item to the session state collection. If the item already exists its value is updated |
| Clear() | Removes all items from the session state collection.|
| Remove(String) | 	Removes the item with the specified name from the session state collection |

- A statement that adds or updates a session state item
```C#
	Session["Email"] = email;
```
- A statement that retrieves the value of a session state item
```C#
	string email = Session["Email"].ToString();
```
- A statement that removes an item from session state
```C#
	Session.Remove("Email");
```
- A statement that retrieves a session state item from a non-page class
```C#
	string email = HttpContext.Current.Session["Email"].ToString();
```
### The page events that can be used to get and save session state data-bound
| Event        | Handler name | Description |
| ------------- |:-------------:| ---------- |
| Load | Page_Load | This event occurs when a page is requested from the server, after all controls have been initialized and view state has been restored. 
| PreRender| Page_PreRender| This event occurs after all the control events for the page have been processed but before the HTML that will be sent back to the browser is generated |
- A Load event handler that gets the session state object named cart
```C#
	private CartItemList cart;
protected void Page_Load(object sender, EventArgs e) 
{
    cart = CartItemList.GetCart();
    if (!IsPostBack) DisplayCart();
}
```
- A click event handler that updates the cart object
```C#
protected void btnRemove_Click(object sender,
    EventArgs e)
{
    if (cart.Count > 0)
    {
        if (lstCart.SelectedIndex > -1)
        {
            cart.RemoveAt(lstCart.SelectedIndex);
            DisplayCart();
        }
        else
        {
            lblMessage.Text =
              "Please select the item you want to remove.";
        }
    }
}
```
- A PreRender event handler that updates a value in the cart object
```C#
	protected void Page_PreRender(object sender, EventArgs e)
	{
		cart["Count"] = sessionCount;
	}

```
***Note :*** You only need to update a session state item explicitly if it's stored in a value-type variable, like an interger. If it's stored in a reference-type variable, like a custom object, the session state item is updated when the variable is updated. That's because the variable is a pointer to the object that's updated.
#### Four modes for storing session state data:
| Mode        | Description |
| ------------- |:-------------:| 
| In-process | stores the data in IIS server memory in the same process as the application. This is the default, but it's only suitable when a single server is used for the application |
| State Server | Stores the data in server memory under the control of the ASP.NET state service. |
|SQL Server | Stores the data in a SQL Server database|
| Customer| Lets you write your own session state store provider |

#### Two options for tracking session IDs
  - Cookie-based - uses cookies.
  - Cookieless - The session ID is encoded as part of the URL

#### Attributes of the session state element in the Web.config file
- Mode - Off, InProc (the default), StateServer, SQLServer, or Custom
- Cookieless - UseCookies (the default). AutoDetect, UseUri
- Timeout
- StateConnectionString
- SqlConnectionString
- AllowCustomSqlDatabase
*A sessionState element in the Web.config file that uses in-process mode:*
```C#
<system.web>
    <sessionState mode="InProc"
                  cookieless="AutoDetect"
                  timeout="30" />
</system.web>

```
***Note***: the programming requirements for all four session state modes are the same , but the State Server and SQL Server modes require objects in session state to be serializable. To make an item serializable, add a Serializable attribute to its class declaration. 
## How to use application state and caching
### Application concepts
In contrast to session state, which stores data for a single user session, application state and caching let you store data that's shared by all users of an application. 
- An ASP.NET application is the collection of pages, code, and other files within a single directory on a web server.
- An application begins when the first user requests a page that’s a part of the application. Then, ASP.NET initializes the application before it processes the request for the page.
- As part of its initialization, ASP.NET creates 
  - an application object from the HttpApplication class 
  - an application state object from the HttpApplicationState class 
  - a cache object from the Cache class.
- These objects exist for the duration of the application, and items stored in application state or cache are available to all users of the application.
- Once an application has started, it doesn’t normally end until the web server is shut down.
### Cache concepts
- Items stored in the cache object don’t necessarily stay in server memory until the application ends.
- They can be set with an expiration date, and they can be scavenged by the server to recover memory when memory is low. 
- The cache object is typically used to store data that changes infrequently, such as a list of states or countries.
### Application state concepts
- Items stored in the application state object stay in server memory until they are specifically removed, or until the application ends.
- Application state is most appropriate for storing small items of data that change as an application executes. 
- To make sure the application object is not accessed by more than one user at a time, it should be locked while updating and unlocked when the update is completed.

#### How to work with the application state and cache data:
- Common indexer of the HttpApplicationState and Cache classes - ```[name]```
- Common property of the HttpApplicationState and Cache classes - ```Count```
- Common methods of the HttpApplicationState and Cache classes - ```Add(name, value)``` - ```Clear()``` - ```Remove(name)```
- The Insert method of the Cache class - 
```Insert(name, value, dependency, 
    absolute, sliding)
``` 
- Common methods of the HttpApplicationState class
  - ```Clear()```
  - ```Lock()```
  - ```Unlock()```

***Example:***
- Two statements that add items to application state and cache
```C#
	Application.Add("ClickCount", 0);
	Cache.Add("states", states);
```
- Two statements that retrieve an item from application state and cache
```C# 
	int applicationCount = Convert.ToInt32(Application["ClickCount"]);
	List<string> states = (List<string>)Cache["states"];
```
- Two statements that retrieve an item from a non-page class
```C#
	int applicationCount = Convert.ToInt32(HttpContext.Current.Application["ClickCount"]);
	List<string> states = (List<string>)HttpContext.Current.Cache["states"]; 
```
- A statement that adds an item to cache with an absolute expiration time
```C#
	Cache.Insert("states", states, null, DateTime.Now.AddMinutes(20), System.Web.Caching.Cache.NoSlidingExpiration);
```
#### How to work with application events
- Application_Start
- Application_End
- Session_Start
- Session_End
***A Global.asax file that creates an object in application state***
```C#
public class Global : System.Web.HttpApplication
{
    protected void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        Application.Add("HitCount", HalloweenDB.GetHitCount());
    }
    protected void Application_End(object sender,EventArgs e)
    {
        //  Code that runs on application shutdown
        HalloweenDB.UpdateHitCount(Application["HitCount"]);
    }
	protected void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        Application.Lock();
            int hitCount = Convert.ToInt32(Application["HitCount"]) + 1;
            Application["HitCount"] = hitCount;
        Application.UnLock();
    }
} 


```
## How to use cookies and URL encoding
### How to use cookies

#### Two ways to create a cookie
```C#
New HttpCookie(name)
New HttpCookie(name, value)
```
#### Common properties of the HttpCookie class
- Expires
- Name
- Secure
- Value
#### Code that creates a session cookie
```C#
	HttpCookie nameCookie = new HttpCookie("UserName", userName);
```
#### Code that creates a persistent cookie
```C#
	HttpCookie nameCookie = new HttpCookie("UserName");
	nameCookie.Value = userName;
	nameCookie.Expires = DateTime.Now.AddYears(1);
```
#### A method that creates a new cookie and adds it to the HttpResponse object
```C#
	private void AddCookie()
	{
		HttpCookie nameCookie = new HttpCookie("UserName", txtUserName.Text);
		nameCookie.Expires = DateTime.Now.AddYears(1);
		Response.Cookies.Add(nameCookie);
	}
```
#### A method that retrieves the value of a cookie from the HttpRequest object
```C#
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
			if (!(Request.Cookies["UserName"] == null))
				lblUserName.Text = "Welcome back, " +
					Request.Cookies["UserName"].Value + ".";
	}

```
#### A method that deletes a persistent cookie
```C#
	private void DeleteCookie()
	{
		HttpCookie nameCookie = new HttpCookie("UserName");
		nameCookie.Expires = DateTime.Now.AddSeconds(-1);
		Response.Cookies.Add(nameCookie);
	}
```
### How to use URL encoding
- Statements that retrieve the values of the query string attributes
```C#
	string categoryID = Request.QueryString["cat"];
	string productID = Request.QueryString["prod"];
```
- Code that uses a URL with a query string in a Redirect method
``` C#
	Response.Redirect("~/Order.aspx?cat=" + categoryID);
```



