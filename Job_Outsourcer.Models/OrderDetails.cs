using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Job_Outsourcer.Models
{
    public class OrderDetails
    {

        public int Id { get; set; }

        [Required]
        public int OrderId { get; set; }
        [ForeignKey("OrderId")]
        public virtual OrderHeader OrderHeader { get; set; }

        [Required]
        public int JobItemId { get; set; }
        [ForeignKey("JobItemId")]
        public virtual JobItem JobItem { get; set; }

        public int Count { get; set; }
        public string Name { get; set; }

        public string Description { get; set; }

        [Required]
        public double Price { get; set; }


     
        public string PartnerId { get; set; }

        [ForeignKey("UserId")]
        public virtual ApplicationUser ApplicationUser { get; set; }

       
       


    }
}
