using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Job_Outsourcer.Pages.Customer.Orders_Archive
{
    public class OrderListModel : PageModel
    {
        public IActionResult OnGet()
        {
            return Page();
        }
    }
}
