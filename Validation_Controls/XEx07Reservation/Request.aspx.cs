using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx07Reservation
{
    public partial class Request : System.Web.UI.Page
    {
        private string currentDate = DateTime.Today.ToShortDateString();
        private string currentYear = DateTime.Today.Year.ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtArrivalDate.Text = currentDate;
                lblYear.Text = currentYear;
                rdoKing.Checked = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Thank you for your request.<br>" +
                "We will get back to you within 24 hours.";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtArrivalDate.Text = currentDate;
            txtDepartureDate.Text = "";
            ddlNoOfPeople.SelectedIndex = -1;
            rdoKing.Checked = true;
            rdoDouble.Checked = false;
            rdoSingle.Checked = false;
            txtSpecialRequests.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddlPreferredMethod.SelectedIndex = 0;
            lblMessage.Text = "";
        }

        protected void CustomValidatorEntry_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }
    }
}