using Mvp2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mvp2
{
    public partial class ParcelList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Parcel> GetParcels([QueryString("customerId")] int? customerId)
        {
            var _db = new OrderContext();
            IQueryable<Parcel> query = _db.Parcels;
            if (customerId.HasValue && customerId > 0)
            {
                query = query.Where(p => p.CustomerID == customerId);
            }
            return query;

        }

        protected void ParcelGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //for the total
        }
    }
}