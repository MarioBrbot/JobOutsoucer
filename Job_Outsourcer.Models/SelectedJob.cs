using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Job_Outsourcer.Models
{
    public class SelectedJob
    {
        public SelectedJob()
        {
            Count = 1;
        }
        public int Id { get; set; }

        public int JobItemId { get; set; }

       
        public  JobItem JobItem { get; set; }

        public string ApplicationUserId { get; set; }

   
        public  ApplicationUser ApplicationUser { get; set; }


        [Range(1, 100, ErrorMessage = "Molim odaberite vrijednost između 1 i 100")]
        [Display(Name = "Količina")]
        public int Count { get; set; }


    }
}
