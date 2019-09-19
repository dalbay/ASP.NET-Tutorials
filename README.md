# ASP.NET - Tutorials

## Validation Controls
### How to use Validation Controls
- If a browser has JavaScript enabled, the validation controls do the job on the client
- Validation is always done on the server too
- Validation is alway done when you click a button whose Cause Validation property is set to True.
- Validation is also done on the client when the focus leaves an input control. The exception is a required field validator
- If a validation control finds invalid data, the IsValid property of that control is set to False
- If you want to perform validation only on the server, you can set the EnabledClientScript properties of the validation controls to False
#### Common validator properties
| Property      | Description         
| ------------- |:-------------:|  
| ControlToValidate      | The id of the control to be validated |  
| Display      | how the control message is to be displayed - Static/Dynamic/None(only display in validation summary)      |   
| Text | The message that's displayed in the validator      |  
| ErrorMessage | displayed in the validation summary control |
| CssClass | applied to the validation's message |
| EnableClientScript | validation will be done on the client |
| SetFocusOnError | Indicates whether the focus will be moved to the control if it's invalid |
| ValidationGroup | Indicates which group the validation control is part of |

#### How to provide for unobtrusive validation
- install the NuGet package for jQuery validation - 'asp.net.scriptmanager.jquery'
- this ceates a Script folder, downloads the JavaScript files for jQuery to that folder, and downloads an assembly that registers jQuery with the ScriptManager and manages the validation.
- if you already have the Bootstrap NuGet package installed, the NuGet package for unobtrusive validation might replace the jQuery files that were downloaded by Bootstrap with a different version. If that happens, you'll need to update the script tags in the head element so they refer to the correct version of jQuery.
- Unobtrusive validation is on by default when you start a new web application from Empty template.
---
### Required Field Validator
Property | Description 
--- | --- 
**InitialValue** | The inidial value of the control that's validated. If this value isn't changed, the validation fails. The default is an empty string.

```ASP
                <div class="form-group">
                    <label class="col-sm-3 control-label">Arrival Date</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtArrivalDate"
                            runat="server"
                            TextMode="DateTime"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <!-- Validator(s) -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorArrivalDate"
                            runat="server"
                            Display="Dynamic"
                            CssClass="text-danger"
                            ControlToValidate="txtArrivalDate"
                            Text="*"
							InitialValue="mm/dd/yyyy">
                        </asp:RequiredFieldValidator>                        
                    </div>
                </div>
```
*Required Field Validator Example with **ValidationGroup** property*
```ASP
                        <asp:DropDownList ID="ddlNoOfPeople" runat="server" CssClass="form-control">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                            runat="server" 
                            ErrorMessage="*" 
                            ControlToValidate="ddlNoOfPeople" 
                            InitialValue="Choose a number..." 
                            ValidationGroup="People" 
                            CssClass="text-danger">
                        </asp:RequiredFieldValidator>
                        <asp:Button ID="btnSubmitNumOfPeople" 
                            runat="server" 
                            Text="Submit" 
                            ValidationGroup="People" 
                            CommandName="People" 
                            CssClass="btn" 
                            OnClick="btnSubmitNumOfPeople_Click" />
```
---
### Compare Validation
| Property      | Description         
| ------------- |:-------------:|  
| ValueToCompare      | The value that the contorl specified in the ControlToValidate property should be compared to. |  
| Operator      | the type of comparioson to perform (Equal, NotEqual, GreaterThan, GreaterThanEqual, LessThan, LessThanEqual, or DataTypeCheck)      |   
| Type | The data type for the comparison (String, Integer, Double, Date, or Currency)      |  
| ControlToCompare | The ID of the control that the value of the control specified in the ControlToValidate property should be compared to |

```ASP
                <div class="form-group">
                    <label class="col-sm-3 control-label">Departure Date</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtDepartureDate" 
                            runat="server" 
                            TextMode="DateTime"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <!-- validator(s) -->
                        <asp:CompareValidator ID="CompareValidatorDepDate" 
                            runat="server" 
                            ControlToValidate="txtDepartureDate" 
                            Operator="LessThan" Type="Date" 
                            Display="Dynamic" 
                            CssClass="text-danger" 
                            ControlToCompare="txtArrivalDate" 
                            Text="Must be after arrival date">
                        </asp:CompareValidator>
                    </div>
                </div>
```
---

### Range Validator
| Property      | Description         
| ------------- |:-------------:|  
| MinimumValue      | The minimum value allowed for the control |  
| MaximumValue      | The maximum value allowed for the control      |   
| Type | The data type for the comparison (String, Integer, Double, Date, or Currency)      |  

```ASP
                    <div class="form-group">
                        <label class="col-sm-1">Quantity:</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtQuantity" 
                                runat="server" 
                                CssClass="form-control">
                            </asp:TextBox>
                        </div>
                        <div class="col-sm-8">
                            <asp:RangeValidator ID="RangeValidator1" 
                                runat="server" 
                                CssClass="text-danger" 
                                ControlToValidate="txtQuantity" 
                                Display="Dynamic" 
                                ErrorMessage="Quantity must range from 1 to 500."
                                MaximumValue="500" 
                                MinimumValue="1" 
                                Type="Integer">
                            </asp:RangeValidator>
                        </div>
                    </div>
```
---

### Regular Expression Validator
| Property      | Description         
| ------------- |:-------------:|  
| ValidationExpression      | A String that specifies a regular expression. The regular expression defines a pattern that the input data must match to be valid. 
- ASP.NET provides some common regualar expressions that you can access from the Regular Expression Editor. To display its dialog box, select the validation control in the Designer, select the ValidationExpression property in the Properties window, and click the ellipsis button.

```ASP
                <div class="form-group">
                    <label class="col-sm-3 control-label">Email address</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtEmail"
                            runat="server"
                            TextMode="Email"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <!-- validator(s) -->
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                            runat="server"
                            Display="Dynamic"
                            CssClass="text-danger"
                            Text="Must be valid email address"                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
```
---

### Custom Validator
| Property      | Description         
| ------------- |:-------------:|  
| Value      | text string to be validated 
| IsValid      | set to true if the value passes
| ValidateEmptyText | Boolean value indicates if you still want to run the test even if there is no user input
- *When you want the validation done on the server side*, place the code within the ServerValidate event's event handler to do the validation.
- double-click on the custom validator control in the Designer; this will output the event handler code; use the arguments value (```*args.Value*```) that is passed into the method to test this input data if its valid  (```*args.IsValid*```)
- When the validation fails, the custom validation error message will be displayed to the user.
- *When you want validation done on the client side*, you will need to code a JavaScript function for it; assign it to the ClientValidationFunction property of the custom validation. This also takes in the input data value(```*args.Value*```)
and evaluates it (```*args.IsValid*```)

```ASP
                <div class="form-group">
                    <label class="col-sm-3 control-label">Enter Unique Value:</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtEntry" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <!-- validator(s) -->
                        <asp:CustomValidator ID="CustomValidatorEntry"
                            runat="server"
                            ErrorMessage="Entry must be unique"
                            CssClass="text-danger"
                            ControlToValidate="txtEntry"
                            ValidateEmptyText="true"
                            ClientValidationFunction="entryIsUnique"
                            OnServerValidate="CustomValidatorEntry_ServerValidate">
                        </asp:CustomValidator>
                    </div>
                </div>
```
*C# code for Sever Side Validation:*
```C#
	        protected void CustomValidatorEntry_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = IsUniqueEntry(args.Value);
        }
        protected bool IsUniqueEntry(string inputValue)
        {
            // compare the input value and return true/false
            return true;
        }
```
*JavaScript code for Client Side Validation:*
```JavaScript
                <script>
                    function testInputValue(args) {
                        args.IsValid = isInputUnique(args.Value);
                    }
                    function isInputUnique(inputValue) {
                        // check the input value; return boolean
                    }                
                </script>
```
---

### Validation Summary Control
| Property      | Description         
| ------------- |:-------------:|  
| DisplayMode      | how messages are displayed (BulletList by default),List,and SingleParagraph
| HeaderText      | displayed before the error message
| ShowSummary | default is true
| ShowMessageBox | default is false

```ASP
                <!-- place it wherever you want the error message displayed -->
                <asp:ValidationSummary ID="ValidationSummary1" 
                    runat="server" 
                    Display="Dynamic" 
                    CssClass="text-danger" 
                    DisplayMode="SingleParagraph"  
                    HeaderText="* means that the field is required" />
```

---