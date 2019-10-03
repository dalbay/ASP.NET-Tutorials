using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for House
/// </summary>
public class House
{
    public int Id { get; set; }
    public string[] Images { get; set; }
    public double Price { get; set; }
    public int Area { get; set; }
    public string Location { get; set; }
    public string Heating { get; set; }
    public string AC { get; set; }
    public string BuildYear { get; set; }
    public string Description { get; set; }


    public House()
    {

    }
    public House(int id, string[] images, double price, int area, string location, string heating, string ac, string buildYear, string description)
    {
        Id = id;
        Images = images;
        Price = price;
        Area = area;
        Location = location;
        Heating = heating;
        AC = ac;
        BuildYear = buildYear;
        Description = description;
    }

    public void AddImages(string[] images)
    {
        Images = images;
    }

}
