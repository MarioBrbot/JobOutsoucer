using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Text;

namespace Job_Outsourcer.Models.ViewModels
{
    public class JobItemVM
    {
        public JobItem JobItem { get; set; }
        public IEnumerable<SelectListItem> JobTypeList { get; set; }
    }
}
