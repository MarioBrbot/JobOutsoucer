using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;


namespace Job_Outsourcer.Pages.Customer.Home
{
    public class IndexModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
        public IEnumerable<SelectListItem> _CountyList;

        public IndexModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _CountyList = _unitOfWork.County.GetCountyListForDropDown();


            appUser = new Models.ApplicationUser();

        }

        [BindProperty]
        public Models.ApplicationUser appUser { get; set; }

       
       

        public IActionResult OnGet()
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);

            appUser.Id = claim.Value;



            appUser = _unitOfWork.ApplicationUser.GetFirstOrDefault(u => u.Id == appUser.Id);






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
