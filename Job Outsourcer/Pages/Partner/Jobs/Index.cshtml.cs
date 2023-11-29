using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Job_Outsourcer.Pages.Partner.Jobs
{
    public class IndexModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public IndexModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

       


        public IEnumerable<County> Counties { get; set; }

    



        public IList<County> GeneratedDetail { get; set; }
        [BindProperty]
        [DisplayName("Odaberite Županiju")]
        public string SelectedCounty { get; set; }

   
        public IList<SelectListItem> CountyListFilter { get; set; } = new List<SelectListItem>();

      
        public IActionResult OnPostFilterGenerated()
        {
            return RedirectToPage("/Partner/Jobs/Index", new { category = SelectedCounty});
        }












        public void OnGet(string category)
        {

            var claimsIdentity = (ClaimsIdentity)this.User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);



            Counties = _unitOfWork.County.GetAll();

      



            GeneratedDetail = new List<County>();


            CountyListFilter.Add(new SelectListItem() { Text = "Sve Županije", Value = "All" });

            foreach (var categ in Counties)
            {
                CountyListFilter.Add(new SelectListItem() { Text = categ.Name, Value = categ.Name }); ;
            }

       


            if (category == null || category == "All")
            {
                GeneratedDetail = Counties.ToList();
                
            }
            else
            {
                GeneratedDetail = Counties.Where(x => x.Name == category).ToList();
                foreach (var item in CountyListFilter)
                {
                    if (item.Value == category)
                    {
                        item.Selected = true;
                        break;
                    }
                }

               
            }
        }
    }
}
