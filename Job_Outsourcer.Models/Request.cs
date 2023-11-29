using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Job_Outsourcer.Models
{
   public class Request
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string UserId { get; set; }

        [ForeignKey("UserId")]
        public virtual ApplicationUser ApplicationUser { get; set; }

        [Required]
        [Display(Name = "Naslov")]
        public string Title { get; set; }

        [Display(Name = "Sadržaj")]
        public string Content { get; set; }

        [Display(Name = "Dokument")]
        public string Document { get; set; }

        public string RequestType { get; set; }

        public string Status { get; set; }


    }
}
