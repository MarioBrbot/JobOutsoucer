using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Utility;

namespace Job_Outsourcer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public UserController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet]
        public IActionResult Get()
        {
            

            return Json(new { data = _unitOfWork.ApplicationUser.GetUsersByRole(StaticDetails.Customer) });
        }


        [HttpPost]
        public IActionResult LockUnlock([FromBody] string id)
        {
            var objFromDb = _unitOfWork.ApplicationUser.GetFirstOrDefault(u => u.Id == id);
            if (objFromDb == null)
            {
                return Json(new { success = false, message = "Pogreška prilikom operacije zaključavanja/otključavanja" });
            }
            //provjera je li korisnik već zaključan, ako je - otključaj ga
            if (objFromDb.LockoutEnd != null && objFromDb.LockoutEnd > DateTime.Now)
            {
                objFromDb.LockoutEnd = DateTime.Now;
            }
            //ako nije zaključaj
            else 
            {
                objFromDb.LockoutEnd = DateTime.Now.AddYears(100);
            }
            _unitOfWork.Save();


            return Json(new { success = true, message = "Operacija uspješna!" });
        }

    }
}