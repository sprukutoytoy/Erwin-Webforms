using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Mvp2.Models
{
    public class Parcel
    {
        [Key, ScaffoldColumn(false)]
        public int ParcelID { get; set; }

        [Required, StringLength(100), Display(Name = "Title")]
        public string Title { get; set; }

        [Required, Display(Name = "Weigth")]
        public double Weight { get; set; }

        public int CustomerID { get; set; }

        public virtual Customer GetCustomer { get; set; }

    }
}