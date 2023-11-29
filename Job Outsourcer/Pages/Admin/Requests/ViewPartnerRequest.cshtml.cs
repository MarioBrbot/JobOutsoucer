using System;
using System.Collections.Generic;
using System.IO;
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
    public class ViewPartnerRequestModel : PageModel
    {
        public class FileModel
        {
            public string FileName { get; set; }
        }

        public List<FileModel> Files { get; set; }


        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _hostingEnvironment;

        public ViewPartnerRequestModel(IUnitOfWork unitOfWork, IWebHostEnvironment hostingEnvironment)
        {
            _unitOfWork = unitOfWork;
            _hostingEnvironment = hostingEnvironment;
        }

        [BindProperty]
        public Request request { get; set; }

        public IActionResult OnGet(int? id)
        {

            string[] filePaths = Directory.GetFiles(Path.Combine(this._hostingEnvironment.WebRootPath, "Documents/"));

            //Copy File names to Model collection.
            this.Files = new List<FileModel>();
            foreach (string filePath in filePaths)
            {
                this.Files.Add(new FileModel { FileName = Path.GetFileName(filePath) });
            }

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

        public FileResult OnGetDownloadFile(string fileName)
        {
            //Build the File Path.
            string path = this._hostingEnvironment.WebRootPath + fileName;

            //Read the File data into Byte Array.
            byte[] bytes = System.IO.File.ReadAllBytes(path);

            //Send the File to Download.
            return File(bytes, "application/octet-stream", fileName);
        }
    }
}
