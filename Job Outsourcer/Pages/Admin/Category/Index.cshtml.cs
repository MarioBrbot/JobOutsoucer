using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;
using Job_Outsourcer.Utility;

namespace Job_Outsourcer.Pages.Admin.Category
{
    [Authorize(Roles = StaticDetails.Admin)]
    public class IndexModel : PageModel
    {
    
        public void OnGet()
        {
        }
    }
}
