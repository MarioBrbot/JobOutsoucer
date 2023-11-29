using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Utility;
using Job_Outsourcer.Models.ViewModels;
using Job_Outsourcer.Models;

namespace Job_Outsourcer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PartnerController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public PartnerController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet]
        public IActionResult Get()
        {


            List<adminPartnerVM> data = new List<adminPartnerVM>();

            var dataPartners = _unitOfWork.ApplicationUser.GetUsersByRole(StaticDetails.Partner);

            foreach (var item in dataPartners)
            {


                IEnumerable<Rating> ratings;
                ratings = _unitOfWork.Rating.GetAll(u => u.UserId == item.Id);

                double total = 0;
                double counter = 1;

                foreach (var itemRating in ratings)
                {
                    counter++;
                    total += itemRating.Value;

                }
                double partnerRating = 0;
                string rating = "";
                if (counter == 1)
                {
                    partnerRating = total / counter;
                }
                else
                {
                    counter--;
                    partnerRating = total / counter;
                }


                if (partnerRating < 1 || partnerRating > 5)
                {
                    partnerRating = 0;
                    rating = "Nije ocijenjen";
                }
                else
                {
                    partnerRating = Math.Round(partnerRating, 2);
                    rating = partnerRating.ToString();

                }

                adminPartnerVM individual = new adminPartnerVM
                {
                    applicationUser = item,

                    rating = rating
                };

                data.Add(individual);

            }





            return Json(new { data = data });
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