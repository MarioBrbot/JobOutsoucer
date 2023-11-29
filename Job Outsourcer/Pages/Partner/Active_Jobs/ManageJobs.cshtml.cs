using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Job_Outsourcer.Models.ViewModels;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Job_Outsourcer.Pages.Partner.Active_Jobs
{
    public class ManageJobsModel : PageModel
    {
        private readonly IUnitOfWork _unitOfWork;

        public ManageJobsModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public List<OrderDetailsViewModel> orderDetailsVM { get; set; }

  


        public void OnGet()
        {
            orderDetailsVM = new List<OrderDetailsViewModel>();

           // && _unitOfWork.OrderDetails.GetById(o.Id).PartnerId == User.FindFirstValue(ClaimTypes.NameIdentifier)

            List<OrderHeader> OrderHeaderList = _unitOfWork.OrderHeader
                .GetAll(o => ( o.Status == StaticDetails.StatusInProcess) )
                .OrderByDescending(u => u.PickUpTime).ToList();




            foreach (OrderHeader item in OrderHeaderList)
            {


                OrderDetailsViewModel individual = new OrderDetailsViewModel
                {
                    OrderHeader = item,
                    OrderDetails = _unitOfWork.OrderDetails.GetFirstOrDefault(o => o.OrderId == item.Id),
                    ApplicationUser = _unitOfWork.ApplicationUser.GetFirstOrDefault(o => o.Id == item.UserId)
                };

                if (individual.OrderDetails.PartnerId == User.FindFirstValue(ClaimTypes.NameIdentifier))
                {


                    orderDetailsVM.Add(individual);

                }
            }
        }







      

    }
}
