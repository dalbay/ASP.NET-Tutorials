using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class County : System.Web.UI.Page
{
    public static string house1ImageUrl;
    public static string house2ImageUrl;
    public static string house3ImageUrl;
    public static string county;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            county = Request.QueryString["ID"].ToString();
        }
        fillHousePrices(county);
    }
    protected void fillHousePrices(string countyName)
    {
        using (HouseCollection_Data houses = new HouseCollection_Data())
        {
            ArrayList list = new ArrayList();
            var item = from p in houses.GetHouses
                       where p.Location == countyName
                       select new House
                       {
                           Price = p.Price,
                           Area = p.Area,
                           Images = p.Images
                       };
            house1ImageUrl = "Images/House/"+ item.ElementAt(0).Images[0];
            house2ImageUrl = "Images/House/"+ item.ElementAt(1).Images[0];
            house3ImageUrl =  "Images/House/"+item.ElementAt(2).Images[0];

            // "Images/House/" + images[0].ToString();
            lblHouse1Price.Text = item.ElementAt(0).Price.ToString("C");
            lblHouse1Area.Text = item.ElementAt(0).Area.ToString() + " SF";
            lblHouse2Price.Text = item.ElementAt(1).Price.ToString("C");
            lblHouse2Area.Text = item.ElementAt(1).Area.ToString() + " SF";

            lblHouse3Price.Text = item.ElementAt(2).Price.ToString("C");
            lblHouse3Area.Text = item.ElementAt(2).Area.ToString() + " SF";
        }
    }
    protected void btnDetails_Click(object sender, CommandEventArgs e)
    {
        // set the value of the CommendArgument as the house id value.
        using (HouseCollection_Data houses = new HouseCollection_Data())
        {
            // pass that house to session
            House house = houses.GetHouse(Convert.ToInt32(e.CommandArgument));
            Session["HouseSelection"] = house;
        }
        Response.Redirect("~/Details.aspx");
    }
}