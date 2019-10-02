using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx09Reservation
{
    public partial class Site : System.Web.UI.MasterPage
    {
        private string currentYear = DateTime.Today.ToShortDateString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblYear.Text = currentYear;
            }
        }
    }
}