using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Job_Outsourcer.Models.ViewModels;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Stripe;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;

namespace Job_Outsourcer.Pages.Customer.Active_Orders
{
    public class ManageOrderModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;
        public IEnumerable<OrderHeader> OrderHeaderTestList;
        public IEnumerable<OrderHeader> OrderHeaderCheckTimeList;

        public ManageOrderModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public List<OrderDetailsViewModel> orderDetailsVM { get; set; }

        [BindProperty]
        public float rating { get; set;}
        public float[] ratings = new[] { (float)1, (float)2, (float)3, (float)4, (float)5 };
    

    public void OnGet()
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);
            OrderHeaderTestList = _unitOfWork.OrderHeader.GetAll(u => u.UserId == claim.Value, null, "ApplicationUser");
            OrderHeaderCheckTimeList = OrderHeaderTestList.Where(o => o.Status == StaticDetails.StatusSubmitted);
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


            orderDetailsVM = new List<OrderDetailsViewModel>();

            List<OrderHeader> OrderHeaderList = _unitOfWork.OrderHeader
                .GetAll(o => (o.Status == StaticDetails.StatusInProcess || o.Status == StaticDetails.StatusSubmitted )&& o.UserId == User.FindFirstValue(ClaimTypes.NameIdentifier))
                .OrderByDescending(u => u.PickUpTime).ToList();




            foreach (OrderHeader item in OrderHeaderList)
            {
                OrderDetailsViewModel individual = new OrderDetailsViewModel
                {
                    OrderHeader = item,
                    OrderDetails = _unitOfWork.OrderDetails.GetFirstOrDefault(o => o.OrderId == item.Id)
                };
                orderDetailsVM.Add(individual);
            }
        }


      

        public IActionResult OnPostOrderReady(int orderId)
        {
            OrderHeader orderHeader = _unitOfWork.OrderHeader.GetFirstOrDefault(o => o.Id == orderId);
            orderHeader.Status = StaticDetails.StatusReady;
            _unitOfWork.Save();
            OrderDetails orderDetails = _unitOfWork.OrderDetails.GetFirstOrDefault(o => o.OrderId == orderId);
            Rating ratingDb = new Models.Rating();
            ratingDb.UserId = orderDetails.PartnerId;
            ratingDb.Value = rating;
            _unitOfWork.Rating.Add(ratingDb);
            _unitOfWork.Save();
       
            return RedirectToPage("ManageOrder");
        }

    

        public IActionResult OnPostOrderRefund(int orderId)
        {
            OrderHeader orderHeader = _unitOfWork.OrderHeader.GetFirstOrDefault(o => o.Id == orderId);
        
            var options = new RefundCreateOptions
            {
                Amount = Convert.ToInt32(orderHeader.OrderTotal * 100),
                Reason = RefundReasons.RequestedByCustomer,
                Charge = orderHeader.TransactionId
            };
            var service = new RefundService();
            Refund refund = service.Create(options);

            orderHeader.Status = StaticDetails.StatusRefunded;
            _unitOfWork.Save();
            return RedirectToPage("ManageOrder");
        }

    }
}
