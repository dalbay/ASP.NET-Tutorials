using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            fillHousePrices();
            // display saved reservation data if there is any
            if (Session["HouseSelection"] != null)
            {
                // clear session
                Session["HouseSelection"] = null;
            }
            else
            {
                // otherwise, ...
            }
        }

    }
    protected void fillHousePrices()
    {
        using (HouseCollection_Data houses = new HouseCollection_Data())
        {
            ArrayList list = new ArrayList();
            var item = from p in houses.GetHouses
                       select new House
                       {
                           Price = p.Price,
                           Area = p.Area
                       };

            lblHouse1Price.Text = item.ElementAt(0).Price.ToString("C");
            lblHouse1Area.Text = item.ElementAt(0).Area.ToString()+ " SF";
            lblHouse2Price.Text = item.ElementAt(1).Price.ToString("C");
            lblHouse2Area.Text = item.ElementAt(1).Area.ToString()+ " SF";

            lblHouse3Price.Text = item.ElementAt(2).Price.ToString("C");
            lblHouse3Area.Text = item.ElementAt(2).Area.ToString() + " SF";
            lblHouse4Price.Text = item.ElementAt(3).Price.ToString("C");
            lblHouse4Area.Text = item.ElementAt(3).Area.ToString() + " SF";

            lblHouse5Price.Text = item.ElementAt(4).Price.ToString("C");
            lblHouse5Area.Text = item.ElementAt(4).Area.ToString() + " SF";
            lblHouse6Price.Text = item.ElementAt(5).Price.ToString("C");
            lblHouse6Area.Text = item.ElementAt(5).Area.ToString() + " SF";
        }
    }

    // Add Command event to properties pane with OnCommand="btnDetails_Click" event handler
    // This way you can use the CommandName and determine which button was clicked.
    protected void btnDetails_Click(object sender, CommandEventArgs e)
    {
        // set the value of the CommendArgument as the house id value.
        using (HouseCollection_Data houses = new HouseCollection_Data())
        {
            // pass that house to session
            House house = houses.GetHouse(Convert.ToInt32(e.CommandArgument));
            Session["HouseSelection"] = house;
        }
        Response.Redirect("~/County.aspx");
    }


}
