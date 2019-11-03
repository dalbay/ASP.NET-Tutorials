# ASP.NET - Tutorials


## Authenticate and Authorize Users
- restirct access to some of the pages of an application
- use of the ASP.NET Identity system.
- Authentication refers to the process of validating the identity of a user so the user  can be granted access to an application. 
- After a user is authenticated, the user must still be authorized to use the requested application. The process of granting user access to an application is called authrization.

### Types of authentications
***Windows-based authentication***  
- Causes the browser to display a login dialog box when the user attempts to access a restricted page.
- Is supported by most browsers.
- Is configured through the IIS management console.
- Uses Windows user accounts and directory rights to grant access to restricted pages.
- Is most appropriate for an intranet application.
***Individual user account authentication***  
- Allows developers to code a login form that gets the user name and password.
- The user name and password entered by the user are encrypted if the login page uses a secure connection.
- Doesn’t rely on Windows user accounts. Instead, the application determines how to authenticate users.
***Third-party authentication services***
- Provided by third parties using technologies like OpenID and OAuth. The Facebook, Google, and Twitter services are the most popular, but Microsoft also offers this kind of service.
- Allows users to use their existing logins, and frees developers from having to worry about the secure storage of user credentials.
- You can configure your ASP.NET applications to issue identities or accept identities from other web applications, and even access user data on other services.
### How individual user account authentication works
- When ASP.NET receives a request for a protected page from a suer who has not been authenticated, the server redirects the user to the login page.
- To be authenticated the user's computer must contain an authentication cookie. By default, this cookie is stored as a session cookie.
- ASP.NET automatically creates an authentication cookie when the application indicates that the user should be authenticated.  
### An intro to ASP.NET Identity
- It can be used with all ASP.NET frameworks, including Web Forms, MVC, and Web API.
- You have more control over the schema of the data store that holds user information, and it’s easier to change the storage system from the default of SQL Server.
- It’s modular, so it’s easier to unit test.
- It supports claims-based authentication, which can be more flexible than using simple roles.
- It supports third party login providers like Microsoft, Google, Facebook, and Twitter.
- It’s based on OWIN (Open Web Interface for .NET) middleware, which is an open source project that defines a standard interface between .NET web servers and web applications. 
- It’s distributed as a NuGet package, so Microsoft can deliver new features and bug fixes faster than before.
### The main objects used by ASP.NET Identity

| Object |  Description
| -------| ----------
| OwinContext  | The OWIN context for the current request
| IdentityDbContext | An EF DbContex  object for working with the Users, Roles, Claims, and Logins of the ASP.NET Identity system.
| IdentityUser | Represents ans authenticated user
| UserStore | Works with users at the database level
| UserManager | Accepts a UserStore and works with users at the application level.
| IdentityRole | Represents a role
| RoleStore | Works with roles at the database level
| RoleManager | Accepts a RoleStore and works with roles at the application level.
| IdentityUserRole | Represents a user that belongs to a role
| SignInManager | Manages sign in operations for users.
| SignInStatus | An enumeration whose values represent the result of a sign in attempt.
| IdentityResult | Represents the result of an identity operation
| ClaimsIdentity | Represents a claims-based identity  
<br/>

### How to get the OwinContext object for the current request
```C#
// In a Code-behind file:
	var ctx = Context.GetOwinContext();

// In a non-page file
	var ctx = HttpContext.CurrentGetOwinContext();
```
