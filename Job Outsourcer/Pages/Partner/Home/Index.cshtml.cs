using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;


namespace Job_Outsourcer.Pages.Partner.Home
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
            rating = "";
        }

        [BindProperty]
        public Models.ApplicationUser appUser { get; set; }

        [BindProperty]
        public string rating { get; set; }




        public IActionResult OnGet()
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);




           








            appUser.Id = claim.Value;



            appUser = _unitOfWork.ApplicationUser.GetFirstOrDefault(u => u.Id == appUser.Id);







            IEnumerable<Rating> ratings;
            ratings = _unitOfWork.Rating.GetAll(u => u.UserId == appUser.Id);

            double total = 0;
            double counter = 1;

            foreach (var itemRating in ratings)
            {
                counter++;
                total += itemRating.Value;

            }
            double partnerRating = 0;
            string rating = "";
            if (counter == 1)
            {
                partnerRating = total / counter;
            }
            else
            {
                counter--;
                partnerRating = total / counter;
            }


            if (partnerRating < 1 || partnerRating > 5)
            {
                partnerRating = 0;
                rating = "Nije ocijenjen";
            }
            else
            {
                partnerRating = Math.Round(partnerRating, 2);
                rating = partnerRating.ToString();

            }

            ViewData["MyString"] = rating;

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
