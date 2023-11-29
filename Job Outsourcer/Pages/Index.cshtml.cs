using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Job_Outsourcer.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        public IActionResult OnGet()
        {
            if (User.IsInRole(StaticDetails.Admin))
            {
                return RedirectToPage("/Admin/Home/Index");
            }
            else if (User.IsInRole(StaticDetails.Partner))
            {
                return RedirectToPage("/Partner/Home/Index");
            }
            else
            {
                return RedirectToPage("/Customer/Jobs/Index");
            }
        }
    }
}
