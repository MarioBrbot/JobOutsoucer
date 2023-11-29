using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using System.IO;
using Job_Outsourcer.Models.ViewModels;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Authorization;

namespace Job_Outsourcer.Pages.Admin.Jobs
{
    [Authorize(Roles = StaticDetails.Admin)]
    public class UpsertModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _hostingEnvironment;

        public UpsertModel(IUnitOfWork unitOfWork, IWebHostEnvironment hostingEnvironment)
        {
            _unitOfWork = unitOfWork;
            _hostingEnvironment = hostingEnvironment;
        }

        [BindProperty]
        public JobItemVM JobItemObj { get; set; }

        public IActionResult OnGet(int? id)
        {
            JobItemObj = new JobItemVM
            {
             
                JobTypeList = _unitOfWork.JobType.GetJobTypeListForDropDown(),
                JobItem = new Models.JobItem()
            };
            if (id != null)
            {
                JobItemObj.JobItem = _unitOfWork.JobItem.GetFirstOrDefault(u => u.Id == id);
                if (JobItemObj.JobItem == null)
                {
                    return NotFound();
                }
            }
            return Page();

        }


        public IActionResult OnPost()
        {
            string webRootPath = _hostingEnvironment.WebRootPath;
            var files = HttpContext.Request.Form.Files;


            if (!ModelState.IsValid)
            {
                return Page();
            }
            if (JobItemObj.JobItem.Id == 0)
            {
                string fileName = Guid.NewGuid().ToString();
                var uploads = Path.Combine(webRootPath, @"images\jobItems");
                var extension = Path.GetExtension(files[0].FileName);

                using (var fileStream = new FileStream(Path.Combine(uploads, fileName + extension), FileMode.Create))
                {
                    files[0].CopyTo(fileStream);
                }
                JobItemObj.JobItem.Image = @"\images\jobItems\" + fileName + extension;

                _unitOfWork.JobItem.Add(JobItemObj.JobItem);



            }
            else
            {
                var objFromDb = _unitOfWork.JobItem.Get(JobItemObj.JobItem.Id);
                if (files.Count > 0)
                {
                    string fileName = Guid.NewGuid().ToString();
                    var uploads = Path.Combine(webRootPath, @"images\jobItems");
                    var extension = Path.GetExtension(files[0].FileName);

                    var imagePath = Path.Combine(webRootPath, objFromDb.Image.TrimStart('\\'));

                    if (System.IO.File.Exists(imagePath))
                    {
                        System.IO.File.Delete(imagePath);
                    }


                    using (var fileStream = new FileStream(Path.Combine(uploads, fileName + extension), FileMode.Create))
                    {
                        files[0].CopyTo(fileStream);
                    }
                    JobItemObj.JobItem.Image = @"\images\jobItems\" + fileName + extension;

                 
                }
                else
                {
                    JobItemObj.JobItem.Image = objFromDb.Image;
                }


                _unitOfWork.JobItem.Update(JobItemObj.JobItem);
            }
            _unitOfWork.Save();
            return RedirectToPage("./Index");
        }
    }
}