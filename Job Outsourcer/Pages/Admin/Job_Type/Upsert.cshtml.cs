using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Microsoft.AspNetCore.Authorization;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Mvc.Rendering;
using Job_Outsourcer.Models.ViewModels;

namespace Job_Outsourcer.Pages.Admin.Job_Type
{
    [Authorize(Roles = StaticDetails.Admin)]
    public class UpsertModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public UpsertModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public JobTypeVM JobTypeObj { get; set; }
        public IEnumerable<SelectListItem> CategoryList;
        public IActionResult OnGet(int? id)
        {



            JobTypeObj = new JobTypeVM
            {
                CategoryList = _unitOfWork.Category.GetCategoryListForDropdown(),
                JobType = new Models.JobType()
               
            };
            if (id != null)
            {
                JobTypeObj.JobType = _unitOfWork.JobType.GetFirstOrDefault(u => u.Id == id);
                if (JobTypeObj.JobType == null)
                {
                    return NotFound();
                }
            }
            return Page();

        }


        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            if (JobTypeObj.JobType.Id == 0)
            {
                _unitOfWork.JobType.Add(JobTypeObj.JobType);
            }
            else
            {
                _unitOfWork.JobType.Update(JobTypeObj.JobType);
            }
            _unitOfWork.Save();
            return RedirectToPage("./Index");
        }
    }
}
