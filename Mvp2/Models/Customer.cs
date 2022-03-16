using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Mvp2.Models
{
    public class Customer
    {
        [Key, ScaffoldColumn(false)]
        public int CustomerID { get; set; }

        [Required, StringLength(100), Display(Name = "Customer Name")]
        public string Name { get; set; }

        [StringLength(10), Display(Name = "Phone Number")]
        public string Phone { get; set; }

        public virtual ICollection<Parcel> Parcels { get; set; }
    }
}