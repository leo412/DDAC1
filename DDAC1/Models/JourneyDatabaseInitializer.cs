//using System;
//using System.Collections.Generic;

//using System.Data.Entity;
//using System.Linq;
//using System.Web;


//namespace DDAC1.Models
//{
//    public class JourneyDatabaseInitializer : DropCreateDatabaseAlways<JourneyContext>

//    {
//        protected override void Seed(JourneyContext context)
//        {
//            GetJournies().ForEach(c => context.Journies.Add(c));
//        }
//        private static List<Journey> GetJournies()
//        {
//            var journies = new List<Journey> {
// new Journey
// {
// CruiseID = 1,
//JourneyID = 1,
//FromDate=DateTime.Now,
//ToDate=DateTime.Now,

////FromDate=DateTime.ParseExact("20-10-2015","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
////ToDate=DateTime.ParseExact("20-10-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
//FromWhere="America",
//ToWhere="Malaysia"

// },
// new Journey
// {
// CruiseID = 2,
//JourneyID = 2,

//FromDate=DateTime.Now,
//ToDate=DateTime.Now,
////FromDate=DateTime.ParseExact("20-10-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
////ToDate=DateTime.ParseExact("28-10-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
//FromWhere="America",
//ToWhere="Japan"

// },new Journey
// {
// CruiseID = 2,
//JourneyID = 3,
//FromDate=DateTime.Now,
//ToDate=DateTime.Now,
////FromDate=DateTime.ParseExact("20-9-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
////ToDate=DateTime.ParseExact("20-10-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
//FromWhere="Malaysia",
//ToWhere="Hawaii"

// },new Journey
// {
// CruiseID = 1,
//JourneyID = 4,
//FromDate=DateTime.Now,
//ToDate=DateTime.Now,
////FromDate=DateTime.ParseExact("9-10-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
////ToDate =DateTime.ParseExact("20-10-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
//FromWhere="Tokyo",
//ToWhere="Thailand"

// },new Journey
// {
// CruiseID = 1,
//JourneyID = 5,
//FromDate=DateTime.Now,
//ToDate=DateTime.Now,
////FromDate=DateTime.ParseExact("1-10-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
////ToDate=DateTime.ParseExact("30-10-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
//FromWhere="India",
//ToWhere="Malaysia"

// },
// };
//            return journies;
//        }

//    }
//}