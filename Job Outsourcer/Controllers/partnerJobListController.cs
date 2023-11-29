using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Job_Outsourcer.Models.ViewModels;
using Job_Outsourcer.Utility;
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
    public class partnerJobListController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;

        public partnerJobListController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }


        [HttpGet]
        public IActionResult Get(string category = null)
        {

            List<partnerJobViewModel> orderListVM = new List<partnerJobViewModel>();

            IEnumerable<OrderHeader> OrderHeaderList;
            IEnumerable<OrderHeader> OrderHeaderCheckTimeList;

            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);

            IEnumerable<PartnerRights> userRatings;
            userRatings = _unitOfWork.PartnerRights.GetAll(u => u.UserId == claim.Value);

            County test = new County();


           OrderHeaderList = _unitOfWork.OrderHeader.GetAll();





            if (category == null || category == "All")
            {

                OrderHeaderCheckTimeList = OrderHeaderList.Where(o => o.Status == StaticDetails.StatusSubmitted);
                DateTime t1 = DateTime.Now;

                foreach (var item2 in OrderHeaderCheckTimeList)
                {
                    int i = DateTime.Compare(t1, item2.PickUpTime);

                    //ako je t1 veci od vrijemena termina onda je veci od 0 te onda napravi refund
                    if (i > 0)
                    {
                        OrderHeader orderHeader = _unitOfWork.OrderHeader.GetFirstOrDefault(o => o.Id == item2.Id);

                        orderHeader.Status = StaticDetails.StatusRefunded;
                        _unitOfWork.Save();


                    }

                }


                foreach (OrderHeader item in OrderHeaderList)
                {
                    partnerJobViewModel individual = new partnerJobViewModel
                    {
                        OrderHeader = item,
                        OrderDetails = _unitOfWork.OrderDetails.GetFirstOrDefault(o => o.OrderId == item.Id),
                        ApplicationUser = _unitOfWork.ApplicationUser.GetUserById(item.UserId),
                        County = _unitOfWork.County.GetFirstOrDefault(o => o.Id == item.ApplicationUser.CountyId)
                    };

                    foreach (PartnerRights right in userRatings)
                    {

                        JobItem job = _unitOfWork.JobItem.GetFirstOrDefault(o => o.Id == individual.OrderDetails.JobItemId);

                        if (right.JobTypeId == job.JobTypeId && individual.OrderHeader.Status == StaticDetails.StatusSubmitted)
                        {
                            orderListVM.Add(individual);
                        }

                    }

                }
            }
            else
             {

                foreach (OrderHeader item in OrderHeaderList)
                {

                 
                        partnerJobViewModel individual = new partnerJobViewModel
                        {
                            OrderHeader = item,
                            OrderDetails = _unitOfWork.OrderDetails.GetFirstOrDefault(o => o.OrderId == item.Id),
                            ApplicationUser = _unitOfWork.ApplicationUser.GetUserById(item.UserId),
                            County = _unitOfWork.County.GetFirstOrDefault(o => o.Id == item.ApplicationUser.CountyId && o.Name == category)
                        };

                        foreach (PartnerRights right in userRatings)
                        {

                            JobItem job = _unitOfWork.JobItem.GetFirstOrDefault(o => o.Id == individual.OrderDetails.JobItemId);

                            if (right.JobTypeId == job.JobTypeId && individual.OrderHeader.Status == StaticDetails.StatusSubmitted && individual.County != null)
                            {
                                orderListVM.Add(individual);
                            }

                        }
                    
                }



            }

            return Json(new { data = orderListVM });



            //return Json(new { data = _unitOfWork.ApplicationUser.GetUsersByRole(StaticDetails.Customer) });
        }

    }
}
//else
//{
//    OrderHeaderList = _unitOfWork.OrderHeader.GetAll(null, null, "ApplicationUser");
//}

//if (status == "objavljen")
//{
//    OrderHeaderList = OrderHeaderList.Where(o => o.Status == StaticDetails.StatusSubmitted);
//}
//else
//{
//    if (status == "obavljen")
//    {
//        OrderHeaderList = OrderHeaderList.Where(o => o.Status == StaticDetails.StatusReady);
//    }
//    else if (status == "refundiran")
//    {
//        OrderHeaderList = OrderHeaderList.Where(o => o.Status == StaticDetails.StatusRefunded);
//    }
//    else
//    {
//        OrderHeaderList = OrderHeaderList.Where(o => o.Status == StaticDetails.StatusInProcess);
//    }
//}