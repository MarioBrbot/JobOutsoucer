using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Job_Outsourcer.Models
{
   public class JobItem
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Ime posla")]
        public string Name { get; set; }
        [Display(Name = "Opis posla")]
        public string Description { get; set; }
        [Display(Name = "Slika posla")]
        public string Image { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Cijena treba biti veća od 1 kn")]
        [Display(Name = "Cijena posla po satu")]
        public double Price { get; set; }

        [Display(Name = "Tip Posla")]
        public int JobTypeId { get; set; }

        [ForeignKey("JobTypeId")]
        public virtual JobType JobType { get; set; }


    }
}
