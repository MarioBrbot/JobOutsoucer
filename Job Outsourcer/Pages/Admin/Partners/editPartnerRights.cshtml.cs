using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Job_Outsourcer.Pages.Admin.Partners
{
    public class editPartnerRightsModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
       

        public editPartnerRightsModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
           


            appUser = new Models.ApplicationUser();

        }

        [BindProperty]
        public Models.ApplicationUser appUser { get; set; }




        public IActionResult OnGet()
        {
           



            return Page();
        }

        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            else
            {
                var claimsIdentity = (ClaimsIdentity)User.Identity;
                var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);








                _unitOfWork.ApplicationUser.UpdateUser(appUser, claim.Value);
            }
            _unitOfWork.Save();

            return RedirectToPage("./Index");
        }
    }
}
