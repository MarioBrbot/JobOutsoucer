using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Job_Outsourcer.Pages.Customer.Jobs
{
    [Authorize]
    public class DetailsModel : PageModel
    {
     
    private readonly IUnitOfWork _unitOfWork;

        public DetailsModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public SelectedJob ShoppingCartObj { get; set; }

        public void OnGet(int id)
        {
            ShoppingCartObj = new SelectedJob()
            {
                JobItem = _unitOfWork.JobItem.GetFirstOrDefault(includeProperties: "JobType", filter: c => c.Id == id),
                JobItemId = id
            };
        }

        public IActionResult OnPost()
        {
            if (ModelState.IsValid)
            {
                var claimsIdentity = (ClaimsIdentity)this.User.Identity;
                var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);

                ShoppingCartObj.ApplicationUserId = claim.Value;

                

                TempData.Put("itemSelected", ShoppingCartObj);
                TempData.Keep();

               
                return RedirectToPage("Summary");

            }
            else
            {
                ShoppingCartObj.JobItem = _unitOfWork.JobItem.GetFirstOrDefault(includeProperties: "JobType", filter: c => c.Id == ShoppingCartObj.JobItemId);
                return Page();

            }
        }

    }
}