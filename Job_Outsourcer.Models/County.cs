using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Job_Outsourcer.Models
{
    public class County
    {

        [Key]
        public int Id { get; set; }


        [Required]
        [Display(Name = "Naziv Županije")]
        public string Name { get; set; }

    }
}
