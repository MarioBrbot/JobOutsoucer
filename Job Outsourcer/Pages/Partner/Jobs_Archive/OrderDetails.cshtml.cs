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

namespace Job_Outsourcer.Pages.Partner.Jobs_Archive
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
       

            public void OnGet(int id)
            {
          
                OrderDetailsVM = new OrderDetailsViewModel()
                {
                    OrderHeader = _unitOfWork.OrderHeader.GetFirstOrDefault(m => m.Id == id),
                    OrderDetails = _unitOfWork.OrderDetails.GetFirstOrDefault(m => m.OrderId == id),
                    
                 };

                OrderDetailsVM.ApplicationUser = _unitOfWork.ApplicationUser.GetFirstOrDefault(m => m.Id == OrderDetailsVM.OrderHeader.UserId);

            }


      

        



    }
}
