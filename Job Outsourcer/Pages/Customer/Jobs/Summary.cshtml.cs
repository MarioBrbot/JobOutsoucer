using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Job_Outsourcer.Models.ViewModels;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Stripe;

namespace Job_Outsourcer.Pages.Customer.Jobs
{
    public class SummaryModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public SummaryModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public OrderDetailsCart detailCart { get; set; }

        public IActionResult OnGet()
        {
            detailCart = new OrderDetailsCart()
            {
                OrderHeader = new Models.OrderHeader()
            };

            detailCart.OrderHeader.OrderTotal = 0;

            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);

      
           
            detailCart.listCart = TempData.Get<SelectedJob>("itemSelected");
            TempData.Keep();
            detailCart.listCart.JobItem = _unitOfWork.JobItem.GetFirstOrDefault(m => m.Id == detailCart.listCart.JobItemId);
                detailCart.OrderHeader.OrderTotal += (detailCart.listCart.JobItem.Price * detailCart.listCart.Count);
            

            ApplicationUser applicationUser = _unitOfWork.ApplicationUser.GetFirstOrDefault(c => c.Id == claim.Value);
            detailCart.OrderHeader.PickUpTime = DateTime.Now;
           
            return Page();

        }

        public IActionResult OnPost(string stripeToken)
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);

          

          

            detailCart.OrderHeader.PaymentStatus = StaticDetails.PaymentStatusPending;
            detailCart.OrderHeader.OrderDate = DateTime.Now;
            detailCart.OrderHeader.UserId = claim.Value;
            detailCart.OrderHeader.Status = StaticDetails.PaymentStatusPending;
            detailCart.OrderHeader.PickUpTime = Convert.ToDateTime(detailCart.OrderHeader.PickUpDate.ToShortDateString() + " " + detailCart.OrderHeader.PickUpTime.ToShortTimeString());

            List<OrderDetails> orderDetailsList = new List<OrderDetails>();
            _unitOfWork.OrderHeader.Add(detailCart.OrderHeader);
            _unitOfWork.Save();

            detailCart.listCart = TempData.Get<SelectedJob>("itemSelected");

            detailCart.listCart.JobItem = _unitOfWork.JobItem.GetFirstOrDefault(m => m.Id == detailCart.listCart.JobItemId);
            
                OrderDetails orderDetails = new OrderDetails
                {
                    JobItemId = detailCart.listCart.JobItemId,
                    OrderId = detailCart.OrderHeader.Id,
                    Description = detailCart.listCart.JobItem.Description,
                    Name = detailCart.listCart.JobItem.Name,
                    Price = detailCart.listCart.JobItem.Price,
                    Count = detailCart.listCart.Count
                };
                detailCart.OrderHeader.OrderTotal += (orderDetails.Count * orderDetails.Price);
                _unitOfWork.OrderDetails.Add(orderDetails);

            
            detailCart.OrderHeader.OrderTotal = Convert.ToDouble(String.Format("{0:.##}", detailCart.OrderHeader.OrderTotal));
         
            HttpContext.Session.SetInt32(StaticDetails.ShoppingCart, 0);
            _unitOfWork.Save();

            if (stripeToken != null)
            {

                var options = new ChargeCreateOptions
                {
                    //Amount is in cents
                    Amount = Convert.ToInt32(detailCart.OrderHeader.OrderTotal * 100),
                    Currency = "usd",
                    Description = "Order ID : " + detailCart.OrderHeader.Id,
                    Source = stripeToken
                };
                var service = new ChargeService();
                Charge charge = service.Create(options);

                detailCart.OrderHeader.TransactionId = charge.Id;

                if (charge.Status.ToLower() == "succeeded")
                {
                    //email 
                    detailCart.OrderHeader.PaymentStatus = StaticDetails.PaymentStatusApproved;
                    detailCart.OrderHeader.Status = StaticDetails.StatusSubmitted;
                   
                }
                else
                {
                    detailCart.OrderHeader.PaymentStatus = StaticDetails.PaymentStatusRejected;
                }
            }
            else
            {
                detailCart.OrderHeader.PaymentStatus = StaticDetails.PaymentStatusRejected;
            }
            _unitOfWork.Save();

            return RedirectToPage("/Customer/Jobs/OrderConfirmation", new { id = detailCart.OrderHeader.Id });


        }

    }
}
