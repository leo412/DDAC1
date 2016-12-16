using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DDAC1.Models
{
    public class Ticket
    {
        public int TicketID { get; set; }

        public int JourneyID { get; set; }

        public string email { get; set; }

        public string CabinType { get; set; }

  
    }
}