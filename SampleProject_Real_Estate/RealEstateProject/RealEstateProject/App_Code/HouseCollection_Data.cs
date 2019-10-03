using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HouseCollection_Data
/// </summary>
public class HouseCollection_Data
{
    List<House> Houses = new List<House>();
    public List<House> GetHouses { get => Houses; }

    public HouseCollection_Data()
    {
        LoadHouses();
    }
    public void LoadHouses()
    {
        House house1 = new House();
        house1.Id = 1;
        house1.Images = new string[]{ "house1rich.jpg", "house1rich1.jpg", "house1rich2.jpg" };
        house1.Price = 120000;
        house1.Area = 1200;
        house1.Location = "Richmond County";
        house1.Heating = "Furnace (forced air distribution system)";
        house1.AC = "Central Air Conditioners and Heat Pumps";
        house1.BuildYear = "The tax records because of the updates gives this property a 1971 build date.";
        house1.Description = "Property Overview - Super Spacious Hill Home 4 bedrooms 2 upstairs with lots of storage closets and bookshelves. Well thought out use of knocked pine that transitions from old time to eternity. This home also has a family room, living room and 1 1/2 baths. The side porch can be accessed from the living room and the basement/workshop is easily accessed from the back of the home. The backyard is spacious with an additional detached storage building in the back yard.";
        Houses.Add(house1);


        House house2 = new House();
        house2.Id = 2;
        house2.Images = new string[] { "house2rich.jpg", "house2rich1.jpg", "house2rich2.jpg" };
        house2.Price = 155000;
        house2.Area = 1430;
        house2.Location = "Richmond County";
        house2.Heating = "Furnace (forced air distribution system)";
        house2.AC = "Central Air Conditioners";
        house2.BuildYear = "The tax records because of the updates gives this property a 1979 build date.";
        house2.Description = "Property Overview - The side porch can be accessed from the living room and the basement/workshop is easily accessed from the back of the home. The backyard is spacious with an additional detached storage building in the back yard.";
        Houses.Add(house2);


        House house3 = new House();
        house3.Id = 3;
        house3.Images = new string[] { "house3rich.jpg", "house3rich1.jpg", "house3rich2.jpg" };
        house3.Price = 170000;
        house3.Area = 2300;
        house3.Location = "Richmond County";
        house3.Heating = "Hybrid Heating-Furnace";
        house3.AC = "Central Air Conditioners";
        house3.BuildYear = "The tax records because of the updates gives this property a 1950 build date.";
        house3.Description = "Property Overview - This home features 3 bedrooms, 1 bath and 2383 SF in the heart of West Augusta. Original baseboards and crown molding. Hardwood throughout, even under carpet in bedrooms. Updated plumbing and windows. HVAC replaced in 2000. New light fixtures in 2003. Stained cabinets in kitchen, granite, tile back-splash, stainless appliances. HUD owned property. FHA Insurable with Escrow.";
        Houses.Add(house3);


        House house4 = new House();
        house4.Id = 4;
        house4.Images = new string[] { "house4col.jpg", "house4col1.jpg", "house4col2.jpg" };
        house4.Price = 210000;
        house4.Area = 2400;
        house4.Location = "Columbia County";
        house4.Heating = "Furnace-Fireplace";
        house4.AC = "Central Air Conditioners";
        house4.BuildYear = "The tax records because of the updates gives this property a 1967 build date.";
        house4.Description = "Property Overview - Magnificent 3 bedroom, 3 full bath, Craftsman style home located in historic Summerville. Home has been updated with Samsung stainless steel appliances, granite counters, custom cabinets, custom vanities. Home has hardwood floors, 10' ceilings throughout, wainscoting, moulding, 4 fireplaces, French doors, fantastic totally revamped yard includes Rainbird irrigation system/drip line. Privacy fence, new driveway, fruit trees and St. Augustine sod...gorgeous landscaped yard. Wonderful location w/in 5 min of AU Medical, University Hospital, Downtown, AU Summerville, Augusta Cyber Center, Savannah River, Riverwalk/Canal and 20 min to Fort Gordon. Walking distance to restaurants and recreation. Home and yard more beautiful in person!";
        Houses.Add(house4);


        House house5 = new House();
        house5.Id = 5;
        house5.Images = new string[] { "house5col.jpg", "house5col1.jpg", "house5col2.jpg" };
        house5.Price = 186000;
        house5.Area = 1900;
        house5.Location = "Columbia County";
        house5.Heating = "Furnace-Fireplace";
        house5.AC = "Central Air Conditioners";
        house5.BuildYear = "The tax records because of the updates gives this property a 1975 build date.";
        house5.Description = "Property Overview - REDUCED!! Charming 2 story in Summerville Terrace on the Hill! Close to area hospitals & ASU Downtown, home offers Large gracious rooms convenient to everything downtown in Augusta & North Augusta! House has a zestimate by Zillow of $279, 523 and Realtor.com has it's value @ $263, 200 w/ an expected increase of 5% next year!";
        Houses.Add(house5);


        House house6 = new House();
        house6.Id = 6;
        house6.Images = new string[] { "house5col.jpg", "house5col1.jpg", "house5col2.jpg" };
        house6.Price = 169000;
        house6.Area = 1750;
        house6.Location = "Columbia County";
        house6.Heating = "Furnace-Fireplace";
        house6.AC = "Central Air Conditioners- Room Air Conditioners";
        house6.BuildYear = "The tax records because of the updates gives this property a 1960 build date.";
        house6.Description = "Property Overview - Location! Location! Location! Welcome to a little slice of Summerville Heaven. This Craftsman style home is conveniently located to schools, shopping, churches and all West Augusta and downtown have to offer. This home is waiting for the perfect family. It has been freshly painted, some new flooring added and the beautiful old original hardwoods refinished. A new metal roof was installed 2 years ago.";
        Houses.Add(house6);
    }
}