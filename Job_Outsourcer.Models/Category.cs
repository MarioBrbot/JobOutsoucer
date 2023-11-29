using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Job_Outsourcer.Models
{
    public class Category
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [Display(Name="Naziv Kategorije")]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Broj Prikaza")]
        public int DisplayOrder { get; set; }

    }
}
