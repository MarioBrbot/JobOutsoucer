using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Job_Outsourcer.Models
{
    public class JobType
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [Display(Name = "Naziv Tipa Posla")]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Kategorija")]
        public int CategoryId { get; set; }
        [ForeignKey("CategoryId")]
        [Display(Name = "Kategorija")]
        public virtual Category Category { get; set; }



    }
}