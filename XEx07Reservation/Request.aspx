<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="XEx07Reservation.Request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 7: Reservations</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <header class="jumbotron">
            <img src="Images/logo.png" alt="Royal Inns and Suites" />
        </header>

        <main>
            <form id="form1" runat="server" class="form-horizontal">
                
                <h1>Reservation Request</h1>
                <!-- place it wherever you want the error message -->
                <asp:ValidationSummary ID="ValidationSummary1" 
                    runat="server" 
                    Display="Dynamic" 
                    CssClass="text-danger" 
                    DisplayMode="SingleParagraph"  
                    HeaderText="* means that the field is required" />
                <h3>Request data</h3>
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
                            Text="*">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidatorArrivalDate" runat="server" Text="*" Type="Date" Display="Dynamic" CssClass="text-danger" Operator="DataTypeCheck" ControlToValidate="txtArrivalDate"></asp:CompareValidator>
                    </div>
                </div>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDepartureDate" runat="server" ControlToValidate="txtDepartureDate" InitialValue="mm/dd/yyyy" Display="Dynamic" CssClass="text-danger" Text="*"></asp:RequiredFieldValidator>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Number of people</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="ddlNoOfPeople" runat="server" CssClass="form-control">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Bed type</label>
                    <div class="col-sm-9 bedtype">
                        <asp:RadioButton ID="rdoKing" runat="server" Text="King" GroupName="Bed" />
                        <asp:RadioButton ID="rdoDouble" runat="server" Text="Two Queens" GroupName="Bed" />
                        <asp:RadioButton ID="rdoSingle" runat="server" Text="One Queen" GroupName="Bed" />
                    </div>
                </div>

                <h3>Special requests</h3>
                <div class="form-group">
                    <div class="col-sm-7">
                        <asp:TextBox ID="txtSpecialRequests" runat="server" TextMode="Multiline"
                             Rows="4" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <h3>Contact information</h3>
                <div class="form-group">
                    <label class="col-sm-3 control-label">First Name</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <!-- validator(s) -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="text-danger" Text="*" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Last Name</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <!-- validator(s) -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" CssClass="text-danger" runat="server" Text="*" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                    </div>
                </div>

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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server"
                            Display="Dynamic"
                            CssClass="text-danger"
                            Text="*"
                            ControlToValidate="txtEmail">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                            runat="server"
                            Display="Dynamic"
                            CssClass="text-danger"
                            Text="Must be valid email address"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail">
                        </asp:RegularExpressionValidator>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Telephone number</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-5">
                        <!-- validator(s) -->
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" CssClass="text-danger" Text="*" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Text="Use this format: 999-999-9999" ValidationExpression="\d{3}(-\d{3})(-\d{4})" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtPhone"></asp:RegularExpressionValidator>
                    </div>
                </div>
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
                <script>
                    function testInputValue(args) {
                        args.IsValid = isInputUnique(args.Value);
                    }
                    function isInputUnique(inputValue) {
                        // check the input value; return boolean
                    }                
                </script>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Preferred method</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="ddlPreferredMethod" runat="server" CssClass="form-control">
                            <asp:ListItem>Email</asp:ListItem>
                            <asp:ListItem>Telephone</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <%-- Submit and Clear buttons --%>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                             CssClass="btn btn-primary" OnClick="btnSubmit_Click"  />
                        <asp:Button ID="btnClear" runat="server" Text="Clear"
                             CssClass="btn btn-primary" OnClick="btnClear_Click"  />
                    </div>
                </div> 
            
                <%-- message label --%>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-11">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-info"></asp:Label>
                    </div>
                </div>

            </form>
        </main>

        <footer>
            <p>&copy; <asp:Label ID="lblYear" runat="server"></asp:Label> 
                Royal Inns and Suites</p>
        </footer>
    </div>
    
</body>
</html>