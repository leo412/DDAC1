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
    public partial class ChooseCruise : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Context.User.Identity.IsAuthenticated)
            {
                //Redirect to login page if No user logged in, 
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    [WebMethod]

        public static IQueryable<Journey> SearchCruise([System.Web.ModelBinding.Control("DropDownListFromWhere")]string FromWhere, [System.Web.ModelBinding.Control("DropDownListToWhere")]string ToWhere, [System.Web.ModelBinding.Control("txtEndDate")]DateTime?  ToDate, [System.Web.ModelBinding.Control("txtStartDate")] DateTime? FromDate)
        {
            //FromWhere = "America";
            var _db = new DDAC1.Models.CruiseContext();
            IQueryable<Journey> query = (from a in _db.Journies where (ToDate >= a.ToDate && FromDate <= a.FromDate) && (((FromWhere == a.FromWhere && ToWhere == "0") ||(FromWhere == a.FromWhere&& ToWhere == a.ToWhere) || (ToWhere == a.ToWhere && FromWhere == "0")) ||( FromWhere == "0" && ToWhere == "0")) select a);
            //IQueryable<Journey> query = (from a in _db.Journies where a.FromWhere == FromWhere select a);
            //IQueryable<Journey> query = _db.Journies;


            return query;

        }
      

      





        public IQueryable<Cruise> GetCruises()
        {
            var _db = new DDAC1.Models.CruiseContext();
            IQueryable<Cruise> query = _db.Cruises;
            return query;
        }
        public IQueryable<Journey> GetJournies()
        {
            var _db = new DDAC1.Models.CruiseContext();
            IQueryable<Journey> query = _db.Journies;
            return query;
        }
        
        public IQueryable<Journey> GetDistinctCountries()
        {
            var _db = new DDAC1.Models.CruiseContext();
         IQueryable<Journey> query = (from a in _db.Journies orderby a.FromWhere select a);
            query.Select(g => g.FromWhere.FirstOrDefault());
            return query;
        }

        //public IQueryable<Journey> GetDistinctCountries2()
        //{
        //    var _db = new DDAC1.Models.CruiseContext();
        //    IQueryable<Journey> query = (from a in _db.Journies where a.FromWhere == "America"  select a).Distinct();
        //    return query;
        //}
        public IQueryable<Journey> GetDistinctCountries2()
        {
            var _db = new DDAC1.Models.CruiseContext();
            IQueryable<Journey> query = (from a in _db.Journies orderby a.ToWhere select a);


            //IQueryable<Journey> query = (from a in _db.Journies orderby a.ToWhere select  a);
            //IQueryable<Journey> query2= query.Select(g => g.ToWhere).Distinct();

            return query;
        }


    }

}