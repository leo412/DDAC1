using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DDAC1.Models
{
    public class Journey
    {
        public int JourneyID { get; set; }

        public int CruiseID { get; set; }

        public DateTime FromDate { get; set; }

        public DateTime ToDate { get; set; }

        public String FromWhere { get; set; }
        public String ToWhere { get; set; }




    }
}