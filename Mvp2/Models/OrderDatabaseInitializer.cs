using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Mvp2.Models
{
    public class OrderDatabaseInitializer : DropCreateDatabaseIfModelChanges<OrderContext>
    {
        protected override void Seed(OrderContext context)
        {
            GetParcels().ForEach(c => context.Parcels.Add(c));
            GetCustomers().ForEach(p => context.Customers.Add(p));
        }

        private static List<Parcel> GetParcels()
        {
            var parcels = new List<Parcel> {
                new Parcel
                {
                    ParcelID = 1,
                    Title = "Cars",
                    Weight = 50,
                    CustomerID = 1
                },
                new Parcel
                {
                    ParcelID = 2,
                    Title = "Planes",
                    Weight = 500,
                    CustomerID = 1
                },
                new Parcel
                {
                    ParcelID = 3,
                    Title = "Trucks",
                    Weight = 120,
                    CustomerID = 1
                },
                new Parcel
                {
                    ParcelID = 4,
                    Title = "Boats",
                    Weight = 385,
                    CustomerID = 1
                },
                new Parcel
                {
                    ParcelID = 5,
                    Title = "Rockets",
                    Weight = 900,
                    CustomerID = 2
                },
            };

            return parcels;
        }

        private static List<Customer> GetCustomers()
        {
            var customers = new List<Customer> {
                new Customer
                {
                    CustomerID = 1,
                    Name = "Lane Arnold",
                    Phone="7749031336"
                },
                new Customer
                {
                    CustomerID = 2,
                    Name = "Monty David",
                    Phone="3446691710"
                },
                new Customer
                {
                    CustomerID = 3,
                    Name = "Shayne Bates",
                    Phone="4439962913"
                },
                new Customer
                {
                    CustomerID = 4,
                    Name = "Bessie Holmes",
                    Phone="0231546843"
                },
                new Customer
                {
                    CustomerID = 5,
                    Name = "Jenny Strickland",
                    Phone="0181937038"
                }
            };

            return customers;
        }
    }
}