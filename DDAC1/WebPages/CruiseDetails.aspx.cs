using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DDAC1.Models;
using System.Web.ModelBinding;
using System.Web.Services;

using System.Web.Mvc;
using System.Web.Mvc.Ajax;
namespace DDAC1.WebPages
{
    public partial class CruiseDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Journey> GetJourneyDetails([QueryString("JourneyId")]int JourneyId)
        {
            var _db = new DDAC1.Models.CruiseContext();
            
            IQueryable<Journey> query = (from a in _db.Journies from c in _db.Cruises where a.JourneyID == JourneyId && a.CruiseID==c.CruiseID select  a );
            return query;
        }
        public IQueryable<Cruise> GetCruiseDetails([QueryString("JourneyId")]int JourneyId)
        {
            var _db = new DDAC1.Models.CruiseContext();

            IQueryable<Cruise> query = (from a in _db.Journies from c in _db.Cruises where a.JourneyID == JourneyId && a.CruiseID == c.CruiseID select c);
            return query;

            
        }
        [WebMethod]
        public static void BuyTicket(int journeyID, string username, string cabintype )
        {
            CruiseContext context= new CruiseContext();
            var tickets = new List<Ticket>

            {new Ticket {
                //TicketID = 1,
                JourneyID = journeyID,
                email=username,
                CabinType=cabintype

     
}
            };

            tickets.ForEach(c => context.Tickets.Add(c));
            context.SaveChanges();
        }
        //protected  void InsertData(CruiseContext context)
        //{
        //    BuyTicket().ForEach(c => context.Cruises.Add(c));


        //}


    }



}