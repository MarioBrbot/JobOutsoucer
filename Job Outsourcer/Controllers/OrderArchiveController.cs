using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Job_Outsourcer.Models.ViewModels;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Authorization;
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
    public class OrderArchiveController : Controller
    {

        private readonly IUnitOfWork _unitOfWork;

        public OrderArchiveController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [HttpGet]
        [Authorize]
        public IActionResult Get(string status = null)
        {
            List<OrderDetailsViewModel> orderListVM = new List<OrderDetailsViewModel>();

            IEnumerable<OrderHeader> OrderHeaderList;
            IEnumerable<OrderHeader> OrderHeaderCheckTimeList;

            List<OrderHeader> orderHeadersList = new List<OrderHeader>();

            if (User.IsInRole(StaticDetails.Customer))
            {
                //dohvati narudbe za customera
                var claimsIdentity = (ClaimsIdentity)User.Identity;
                var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);
                OrderHeaderList = _unitOfWork.OrderHeader.GetAll(u => u.UserId == claim.Value, null, "ApplicationUser");
            }
            else if (User.IsInRole(StaticDetails.Partner))
            {
                //dohvati narudbe za partnera
                var claimsIdentity = (ClaimsIdentity)User.Identity;
                var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);

                var orders = _unitOfWork.OrderDetails.GetAll(u => u.PartnerId == claim.Value);

                foreach (var item in orders) {

                    var ordersHeader = _unitOfWork.OrderHeader.GetFirstOrDefault(u => u.Id == item.Id);
                    orderHeadersList.Add(ordersHeader);

                   // OrderHeaderList = orderHeadersList;
                }
                OrderHeaderList = orderHeadersList;
                //OrderHeaderList = _unitOfWork.OrderHeader.GetAll(u => u.UserId == claim.Value, null, "ApplicationUser");
            }
            else
            {
                OrderHeaderList = _unitOfWork.OrderHeader.GetAll(null, null, "ApplicationUser");
            }

            if (status == "objavljen")
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


                OrderHeaderList = OrderHeaderList.Where(o => o.Status == StaticDetails.StatusSubmitted );
            }
            else
            {
                if (status == "obavljen")
                {
                    OrderHeaderList = OrderHeaderList.Where(o => o.Status == StaticDetails.StatusReady);
                }
                else if (status == "refundiran")
                {
                    OrderHeaderList = OrderHeaderList.Where(o => o.Status  == StaticDetails.StatusRefunded);
                }
                else
                {
                    OrderHeaderList = OrderHeaderList.Where(o => o.Status == StaticDetails.StatusInProcess);
                }
            }

            foreach (OrderHeader item in OrderHeaderList)
            {
                OrderDetailsViewModel individual = new OrderDetailsViewModel
                {
                    OrderHeader = item,
                    OrderDetails = _unitOfWork.OrderDetails.GetFirstOrDefault(o => o.OrderId == item.Id),
                    ApplicationUser = _unitOfWork.ApplicationUser.GetUserById(item.UserId)
                };
                orderListVM.Add(individual);
            }

            return Json(new { data = orderListVM });
        }

    }
}
