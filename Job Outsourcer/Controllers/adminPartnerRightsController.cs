using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Job_Outsourcer.Models.ViewModels;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
//using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text.Json;
using System.Threading.Tasks;
using System.Web;
using System.Text.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

namespace Job_Outsourcer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class adminPartnerRightsController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public List<partnerEditRatingsVM> model = new List<partnerEditRatingsVM>();

        public adminPartnerRightsController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet]
        public IActionResult Get()
        {


            string id = HttpContext.Request.Query["id"].ToString();

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
                      if (item.Id == right.JobTypeId && id == right.UserId )
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

        public class ParamObj
        {
            public string id { get; set; }
            public string jobTypeId { get; set; }

        }

        [HttpPost]
        public IActionResult LockUnlock([FromBody] ParamObj o)
        {


            //var json = JsonConvert.DeserializeObject<string>(requestData);

          //  JObject o = JObject.Parse(json);

            // JObject requestData2 = JsonConvert.SerializeObject(json);
            //  var responseData = JsonSerializer.Deserialize<JsonElement>(requestData).TryGetProperty("id");


            //   dynamic json = JsonSerializer.Deserialize(requestData);

            string id = o.id;

          int jobTypeId = Int32.Parse( o.jobTypeId);


            var objFromDb = _unitOfWork.PartnerRights.GetFirstOrDefault(u => u.UserId == id && u.JobTypeId == jobTypeId);
            if (objFromDb == null)
            {


                PartnerRights partnerRightsDb = new Models.PartnerRights();
                partnerRightsDb.UserId = id;
                partnerRightsDb.JobTypeId = jobTypeId;
                _unitOfWork.PartnerRights.Add(partnerRightsDb);
                _unitOfWork.Save();

             

            }
            
            if (objFromDb != null )
            {
                
                _unitOfWork.PartnerRights.Remove(objFromDb);
                _unitOfWork.Save();
                return Json(new { success = true, message = "Uspješno obrisano!" });
            }
      


            return Json(new { success = true, message = "Operacija uspješna!" });
        }
    }
}
