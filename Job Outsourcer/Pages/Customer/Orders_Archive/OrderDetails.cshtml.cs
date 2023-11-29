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

namespace Job_Outsourcer.Pages.Customer.Orders_Archive
{
    public class OrderDetailsModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public OrderDetailsModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public OrderDetailsViewModel OrderDetailsVM { get; set; }
        [BindProperty]
        public float rating { get; set; }
        public float[] ratings = new[] { (float)1, (float)2, (float)3, (float)4, (float)5 };

        public void OnGet(int id)
        {
            OrderDetailsVM = new OrderDetailsViewModel()
            {
                OrderHeader = _unitOfWork.OrderHeader.GetFirstOrDefault(m => m.Id == id),
                OrderDetails = _unitOfWork.OrderDetails.GetFirstOrDefault(m => m.OrderId == id)
               
            };

            OrderDetailsVM.ApplicationUser = _unitOfWork.ApplicationUser.GetFirstOrDefault(m => m.Id == OrderDetailsVM.OrderDetails.PartnerId);
         
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
            return RedirectToPage("OrderList");
        }

    }
}
