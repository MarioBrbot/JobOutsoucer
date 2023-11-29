using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Job_Outsourcer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class partnerRequestController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public partnerRequestController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Json(new { data = _unitOfWork.Request.GetAll(u => u.RequestType == StaticDetails.Partner, null, "ApplicationUser") });
        }

    }
}
