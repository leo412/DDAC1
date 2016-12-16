using System;
using System.Collections.Generic;

using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Configuration; 

namespace DDAC1.Models
{
    public class CruiseDatabaseInitializer: DropCreateDatabaseIfModelChanges<CruiseContext>

    {
        protected override void Seed(CruiseContext context)
        {
            GetCruises().ForEach(c => context.Cruises.Add(c));
            GetJournies().ForEach(c => context.Journies.Add(c));


        }
        private static List<Journey> GetJournies()
        {
            var journies = new List<Journey> {
 new Journey
 {
 CruiseID = 1,
JourneyID = 1,
//FromDate=DateTime.Now,
//ToDate=DateTime.Now,

FromDate=DateTime.ParseExact("18-12-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
ToDate=DateTime.ParseExact("30-12-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
FromWhere="Japan",
ToWhere="Malaysia"

 },
 new Journey
 {
 CruiseID = 2,
JourneyID = 2,

//FromDate=DateTime.Now,
//ToDate=DateTime.Now,
FromDate=DateTime.ParseExact("02-01-2017","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
ToDate=DateTime.ParseExact("05-01-2017","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
FromWhere="America",
ToWhere="Japan"

 },new Journey
 {
 CruiseID = 3,
JourneyID = 3,
//FromDate=DateTime.Now,
//ToDate=DateTime.Now,
FromDate=DateTime.ParseExact("20-12-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
ToDate=DateTime.ParseExact("21-12-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
FromWhere="Malaysia",
ToWhere="Hawaii"

 },new Journey
 {
 CruiseID = 4,
JourneyID = 4,
//FromDate=DateTime.Now,
//ToDate=DateTime.Now,
FromDate=DateTime.ParseExact("20-11-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
ToDate=DateTime.ParseExact("28-11-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
FromWhere="Tokyo",
ToWhere="Thailand"

 },new Journey
 {
 CruiseID = 5,
JourneyID = 5,
//FromDate=DateTime.Now,
//ToDate=DateTime.Now,
FromDate=DateTime.ParseExact("30-12-2016","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
ToDate=DateTime.ParseExact("05-01-2017","dd-MM-yyyy", System.Globalization.CultureInfo.InvariantCulture),
FromWhere="India",
ToWhere="Taiwan"

 },
 };
            return journies;
        }
        private static List<Ticket> GetTickets()
        {
            var cruises = new List<Cruise>
            {






            };
return null;
        }

            
        private static List<Cruise> GetCruises()
        {
            var cruises = new List<Cruise> {
 new Cruise
 {
 CruiseID = 1,
CruiseName = "Cruisa",
InsideCabinPrice=50,
OceanViewCabinPrice=100,
BalconyCabinPrice=150,


 },
 new Cruise
 {
 CruiseID = 2,
CruiseName = "Elegant",
InsideCabinPrice=50,
OceanViewCabinPrice=100,
BalconyCabinPrice=150,
 },
 new Cruise{
 CruiseID = 3,
 CruiseName = "Titanic",
 InsideCabinPrice=50,
OceanViewCabinPrice=100,
BalconyCabinPrice=150,
 },
 new Cruise
 {
 CruiseID = 4,
CruiseName = "Titan",
InsideCabinPrice=50,
OceanViewCabinPrice=100,
BalconyCabinPrice=150,
 },
 new Cruise
 {
 CruiseID = 5,
 CruiseName = "Swimmer",
 InsideCabinPrice=50,
OceanViewCabinPrice=100,
BalconyCabinPrice=150,
 },
 };
            return cruises;
        }

        

    }




}