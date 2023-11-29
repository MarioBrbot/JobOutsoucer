using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Job_Outsourcer.Models.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;


namespace Job_Outsourcer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class partnerRightsController : Controller
    {

        private readonly IUnitOfWork _unitOfWork;
        public List<partnerEditRatingsVM> model = new List<partnerEditRatingsVM>();
        public partnerRightsController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet]
        public IActionResult Get()
        {
            //var claimsIdentity = (ClaimsIdentity)User.Identity;
            //var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);
            //return Json(new { data = _unitOfWork.PartnerRights.GetAll(u => u.UserId == claim.Value) });



           /// string id = HttpContext.Request.Query["id"].ToString();

            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);

            var jobTypes = _unitOfWork.JobType.GetAll();
            var partnerRights = _unitOfWork.PartnerRights.GetAll();

            var job = new JobType();
            string statusJob = "";

            foreach (var item in jobTypes)
            {
                foreach (var right in partnerRights)
                {
                    if (item.Id == right.JobTypeId && claim.Value == right.UserId)
                    {
                        statusJob = "Dozvoljeno";
                    }
                }
                if (statusJob != "Dozvoljeno")
                {
                    statusJob = "Nije dozvoljeno";
                }

                partnerEditRatingsVM product = new partnerEditRatingsVM();
                product.JobType = item;
                product.status = statusJob;
                statusJob = "";
                model.Add(product);
            }


            return Json(new { data = model });


        }


        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var objFromDb = _unitOfWork.PartnerRights.GetFirstOrDefault(u => u.Id == id);
            if (objFromDb == null)
            {
                return Json(new { success = false, message = "Pogreška prilikom brisanja!" });
            }
            _unitOfWork.PartnerRights.Remove(objFromDb);
            _unitOfWork.Save();
            return Json(new { success = true, message = "Uspješno obrisano!" });
        }


    }
}
