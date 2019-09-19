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
### Required Field Validator
Property | Description 
--- | --- | ---
**InitialValue** | The inidial value of the control that's validated. If this value isn't changed, the validation fails. The default is an empty string.

``` 
                <div class="form-group">
                    <label class="col-sm-3 control-label">Arrival Date</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtArrivalDate"
                            runat="server"
                            TextMode="DateTime"
                            CssClass="form-control">
                        </asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <!-- validator(s) -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorArrivalDate"
                            runat="server"
                            ControlToValidate="txtArrivalDate"
                            InitialValue="mm/dd/yyyy"
                            ErrorMessage="*">                            
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
```
