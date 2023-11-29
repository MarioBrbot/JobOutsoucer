﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Job_Outsourcer.Models
{
    public class OrderHeader
    {

        [Key]
        public int Id { get; set; }

        [Required]
        public string UserId { get; set; }

        [ForeignKey("UserId")]
        public virtual ApplicationUser ApplicationUser { get; set; }

        [Required]
        [Display(Name = "Termin narudžbe")]
        public DateTime OrderDate { get; set; }

        [Required]
        [DisplayFormat(DataFormatString = "{0:C}")]
        [Display(Name = "Ukupna cijena")]
        public double OrderTotal { get; set; }

        [Required]
        [Display(Name = "Pick Up vrijeme")]
        public DateTime PickUpTime { get; set; }

        [Required]
        [NotMapped]
        public DateTime PickUpDate { get; set; }

        public string Status { get; set; }

        public string PaymentStatus { get; set; }
        [Display(Name = "Komentari")]
        public string Comments { get; set; }

    
        public string TransactionId { get; set; }


    }
}
