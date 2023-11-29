using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Job_Outsourcer.Pages.Partner.Requests
{
    public class IndexModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _hostingEnvironment;

        public IndexModel(IUnitOfWork unitOfWork, IWebHostEnvironment hostingEnvironment)
        {
            _unitOfWork = unitOfWork;
            _hostingEnvironment = hostingEnvironment;
        }

        [BindProperty]
        public Request request { get; set; }

        public IActionResult OnGet(int? id)
        {

            request = new Models.Request();




            return Page();

        }


        public IActionResult OnPost()
        {
            string webRootPath = _hostingEnvironment.WebRootPath;
            var files = HttpContext.Request.Form.Files;




            string fileName = Guid.NewGuid().ToString();
            var uploads = Path.Combine(webRootPath, @"documents");
            var extension = Path.GetExtension(files[0].FileName);

            using (var fileStream = new FileStream(Path.Combine(uploads, fileName + extension), FileMode.Create))
            {
                files[0].CopyTo(fileStream);
            }
            request.Document = @"\documents\" + fileName + extension;


            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);

            request.RequestType = StaticDetails.RequestPartner;
            request.UserId = claim.Value;
            request.Status = StaticDetails.RequestStatusUnread;
            _unitOfWork.Request.Add(request);




            _unitOfWork.Save();
            return RedirectToPage("./Index");
        }
    }
}
