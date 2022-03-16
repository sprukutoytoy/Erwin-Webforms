using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mvp2.Models;

namespace Mvp2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAddCustomer_Click(object sender, EventArgs e)
        {
            string name = inputName.Value;
            string phone = inputPhone.Value;

            using (var db = new OrderContext())
            {
                var customers = db.Set<Customer>();
                customers.Add(new Customer { Name = name, Phone = phone });

                db.SaveChanges();
            }

            RefreshPage();
        }

        private void RefreshPage()
        {
            Response.Redirect("~/CustomerList.aspx");
        }

        //Select
        public IQueryable<Customer> GetCustomers()
        {
            var _db = new OrderContext();
            IQueryable<Customer> query = _db.Customers;
            return query;
        }

        //Update
        public void CustomersGrid_UpdateItem(int CustomerID)
        {
            //Finding the controls from Gridview for the row which is going to update
            Customer item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            using (var db = new OrderContext())
            {
                item = db.Customers.SingleOrDefault(b => b.CustomerID == CustomerID);

                if (item == null)
                {
                    // The item wasn't found
                    ModelState.AddModelError("", $"Item with id {CustomerID} was not found");
                    return;
                }
                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    // Save changes here, e.g. MyDataLayer.SaveChanges();
                    db.SaveChanges();
                }
            }
        }

        //Delete
        public void CustomersGrid_DeleteItem(int CustomerID)
        {
            Customer customer = new Customer() { CustomerID = CustomerID };

            using (var db = new OrderContext())
            {
                db.Customers.Attach(customer);
                db.Customers.Remove(customer);
                db.SaveChanges();
            }
        }
    }
}