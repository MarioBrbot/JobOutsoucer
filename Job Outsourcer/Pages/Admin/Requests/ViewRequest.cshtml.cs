using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Job_Outsourcer.Pages.Admin.Requests
{
    public class ViewRequestModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _hostingEnvironment;

        public ViewRequestModel(IUnitOfWork unitOfWork, IWebHostEnvironment hostingEnvironment)
        {
            _unitOfWork = unitOfWork;
            _hostingEnvironment = hostingEnvironment;
        }

        [BindProperty]
        public Request request { get; set; }

        public IActionResult OnGet(int? id)
        {
           
                request = _unitOfWork.Request.GetFirstOrDefault(u => u.Id == id);
                if (request == null)
                {
                    return NotFound();
                }
            
            return Page();

        }

        public IActionResult OnPost()
        {
            request.Status = StaticDetails.RequestStatusRead;
            _unitOfWork.Request.Update(request);
          
            return RedirectToPage("./CustomerRequests");

        }
        }
}
