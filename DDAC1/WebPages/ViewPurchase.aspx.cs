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
    public partial class ViewPurchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Context.User.Identity.IsAuthenticated)
            {
                //Redirect to login page if No user logged in, 
                Response.Redirect("~/Account/Login.aspx");
            }
        }
        public IQueryable<Ticket> GetTicketDetails([QueryString("email")]string email)
       {
            var _db = new DDAC1.Models.CruiseContext();

            IQueryable<Ticket> query = (from a in _db.Tickets  where a.email == email select a);
            return query;
        }
    }
}