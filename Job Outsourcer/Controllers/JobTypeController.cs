using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;

namespace Job_Outsourcer.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class JobTypeController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public JobTypeController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Json(new { data = _unitOfWork.JobType.GetAll(null, null, "Category") });
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var objFromDb = _unitOfWork.JobType.GetFirstOrDefault(u => u.Id == id);
            if (objFromDb == null)
            {
                return Json(new { success = false, message = "Pogreška prilikom brisanja." });
            }
            _unitOfWork.JobType.Remove(objFromDb);
            _unitOfWork.Save();
            return Json(new { success = true, message = "Brisanje uspješno." });
        }

    }
}
