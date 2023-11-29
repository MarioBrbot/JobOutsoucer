using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Job_Outsourcer.Models
{
    public class ApplicationUser : IdentityUser
    {
        [Display(Name ="Ime")]
        public string FirstName { get; set; }

        [Display(Name = "Prezime")]
        public string LastName { get; set; }

        [Display(Name = "Adresa")]
        public string Address { get; set; }

        [Required]
        public int CountyId { get; set; }
        [ForeignKey("CountyId")]
        public virtual County County { get; set; }


       

        [NotMapped]
        [Display(Name = "Ime i prezime")]
        public string FullName { get { return FirstName + " " + LastName; } }
    }
}
