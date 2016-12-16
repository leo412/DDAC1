using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace DDAC1.Models
{
    public class CruiseContext:DbContext
    {

        public CruiseContext() : base("DefaultConnection")
 {
        }
        public DbSet<Cruise> Cruises { get; set; }

        public DbSet<Journey> Journies { get; set; }
        public DbSet<Ticket> Tickets { get; set; }


    }
}