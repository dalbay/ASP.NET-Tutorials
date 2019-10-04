using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class County : System.Web.UI.Page
{
    public static string imageUrl;
    public static string image2Url;
    public static string image3Url;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["HouseSelection"] != null)
        {
            lblPrice.Text = ((House)Session["HouseSelection"]).Price.ToString("C");
            lblArea.Text = ((House)Session["HouseSelection"]).Area.ToString() + " SF";
            lblLocation.Text = ((House)Session["HouseSelection"]).Location;
            lblAC.Text = ((House)Session["HouseSelection"]).AC;
            lblBuildYear.Text = ((House)Session["HouseSelection"]).BuildYear;
            lblDescription.Text = ((House)Session["HouseSelection"]).Description;
            string[] images = ((House)Session["HouseSelection"]).Images;
            imageUrl = "Images/House/"+images[0].ToString();
            image2Url = "Images/House/"+images[1].ToString();
            image3Url = "Images/House/"+images[2].ToString();
        }
    }
}