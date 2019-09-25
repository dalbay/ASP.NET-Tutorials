using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx08Reservation
{
    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //if the page request isn't postback
            {
                lblYear.Text = DateTime.Today.Year.ToString();
                // display saved reservation data if there is any
                if (Session["Reservation"] != null)
                {
                    DisplayReservation();
                }
                else
                {

                }
            }
        }

        private void DisplayReservation()
        {
            //get the reservation object from session
            Reservation reservation = (Reservation)Session["Reservation"];

            lblArrivalDate.Text = reservation.ArrivalDate.ToShortDateString();
            lblDepartureDate.Text = reservation.DepartureDate.ToShortDateString();
            lblNoOfPeople.Text = reservation.NoOfPeople.ToString();
            lblNoOfDays.Text = reservation.NoOfPeople.ToString();
            if (reservation.BedType == "King")
                lblBedType.Text = "King";
            else if (reservation.BedType == "Two Queens")
                lblBedType.Text = "Two Queens";
            else
                lblBedType.Text = "Single";

            lblSpecialRequests.Text = reservation.SpecialRequests;
            lblFirstName.Text = reservation.FirstName;
            lblLastName.Text = reservation.LastName;
            lblEmail.Text = reservation.Email;
            lblPhone.Text = reservation.Phone;
            lblPreferredMethod.Text = reservation.PreferredMethod;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Thank you for your request.<br> We will get back to you within 24 hours.";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            AddCookie();
        }
        //create two persistent cookies with the first name and email and add to HttpResponse object.
        //set expiration date to six month from current date
        private void AddCookie()
        {
            HttpCookie fnameCookie = new HttpCookie("FirstName", lblFirstName.Text);
            fnameCookie.Expires = DateTime.Now.AddMonths(6);
            HttpCookie emailCookie = new HttpCookie("Email", lblEmail.Text);
            emailCookie.Expires = DateTime.Now.AddMonths(6);
            Response.Cookies.Add(fnameCookie);
            Response.Cookies.Add(emailCookie);
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Response.Redirect("Request.aspx");
        }
    }
}