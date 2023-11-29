using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Text;

namespace Job_Outsourcer.Models.ViewModels
{
    public class JobTypeVM
    {
        public JobType JobType { get; set; }
        public IEnumerable<SelectListItem> CategoryList { get; set; }

       

    }
}
