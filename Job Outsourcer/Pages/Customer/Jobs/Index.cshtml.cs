using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Job_Outsourcer.DataAccess.Data.Repository;
using System.Security.Claims;
using Microsoft.AspNetCore.Http;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel;

namespace Job_Outsourcer.Pages.Customer.Jobs
{
    public class IndexModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public IndexModel(IUnitOfWork unitOfWork) {
            _unitOfWork = unitOfWork; 
        }

        public IEnumerable<Category>  CategoryList { get; set; }

      

        public IEnumerable<JobItem> JobItemList { get; set; }

        public IEnumerable<JobType> JobTypeList { get; set; }


        public IList<Category> GeneratedDetail { get; set; }
        [BindProperty]
        [DisplayName("Odaberite Kategoriju")]
        public string SelectedCategory { get; set; }

        [BindProperty]
        [DisplayName("Odaberite Tip Posla")]
        public string SelectedJobType { get; set; }
        public IList<SelectListItem> CategoryListFilter { get; set; } = new List<SelectListItem>();

        public IList<SelectListItem> JobTypeListFilter { get; set; } = new List<SelectListItem>();
        public IActionResult OnPostFilterGenerated()
        {
            return RedirectToPage("/Customer/Jobs/Index", new { category = SelectedCategory, jobType = SelectedJobType  });
        }



    








        public void OnGet( string category , string jobType)
        {

            var claimsIdentity = (ClaimsIdentity)this.User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);

        



            JobItemList = _unitOfWork.JobItem.GetAll(null, null, "JobType");
            CategoryList = _unitOfWork.Category.GetAll(null, q => q.OrderBy(c => c.DisplayOrder), null);

            JobTypeList = _unitOfWork.JobType.GetAll();
            


            GeneratedDetail = new List<Category>();
                     

            CategoryListFilter.Add(new SelectListItem() { Text = "Sve Kategorije", Value = "All" });

            foreach (var categ in CategoryList)
            {
                CategoryListFilter.Add(new SelectListItem() { Text = categ.Name, Value = categ.Name }); ;
            }

            JobTypeListFilter.Add(new SelectListItem() { Text = "Svi tipovi posla", Value = "All" });

            foreach (var type in JobTypeList)
            {
             

                JobTypeListFilter.Add(new SelectListItem() { Text = type.Name, Value = type.Name });

            }



            if (category == null || category == "All")
            {
                GeneratedDetail = CategoryList.ToList();
                if (jobType == null || jobType == "All")
                {

                }
                else {
                    JobItemList = JobItemList.Where(c => c.JobType.Name == jobType);
                    foreach (var item in JobTypeListFilter)
                    {
                        if (item.Value == jobType)
                        {
                            item.Selected = true;
                            break;
                        }
                    }

                }
            }
            else
            {
                GeneratedDetail = CategoryList.Where(x => x.Name == category).ToList();
                foreach (var item in CategoryListFilter)
                {
                    if (item.Value == category)
                    {
                        item.Selected = true;
                        break;
                    }
                }

                if (jobType == null || jobType == "All")
                {

                }
                else
                {
                    JobItemList = JobItemList.Where(c => c.JobType.Name == jobType);
                    foreach (var item in JobTypeListFilter)
                    {
                        if (item.Value == jobType)
                        {
                            item.Selected = true;
                            break;
                        }
                    }

                }
            }
        }
    }
}
