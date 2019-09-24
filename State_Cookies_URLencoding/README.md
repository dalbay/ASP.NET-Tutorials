# ASP.NET - Tutorials

## How to work with state, cookies, and URL encoding

### View State
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
 
| Properties        | Description |
| ------------- |:-------------:| 
| Count | Gets the number of StateItem objects in the StateBag object.|
| Keys | Gets a collection of keys representing the items in the StateBag object.|
| Values | Gets a collection of the view-state values stored in the StateBag object.|

| Methods        | Description |
| ------------- |:-------------:| 
| Add(String, Object) | Adds a new StateItem object to the StateBag object. If the item already exists in the StateBag object, this method updates the value of the item.|
| Clear() | Removes all items from the current StateBag object.|
| Remove(String) | 	Removes the specified key/value pair from the StateBag object.|