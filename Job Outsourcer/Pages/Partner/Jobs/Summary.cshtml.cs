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
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Job_Outsourcer.Pages.Partner.Jobs
{
    public class SummaryModel : PageModel
    {

        private readonly IUnitOfWork _unitOfWork;

        public SummaryModel(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        [BindProperty]
        public partnerJobViewModel ShoppingCartObj { get; set; }

        public void OnGet(int id)
        {
            OrderHeader OrderHeader = _unitOfWork.OrderHeader.GetFirstOrDefault(c => c.Id == id);

            ShoppingCartObj = new partnerJobViewModel()
            {
                OrderDetails = _unitOfWork.OrderDetails.GetFirstOrDefault(c => c.Id == id),
                OrderHeader = _unitOfWork.OrderHeader.GetFirstOrDefault(c => c.Id == id),
                ApplicationUser = _unitOfWork.ApplicationUser.GetUserById(OrderHeader.UserId),
                County = _unitOfWork.County.GetFirstOrDefault(o => o.Id == OrderHeader.ApplicationUser.CountyId)

            };
            TempData.Put("itemSelected", ShoppingCartObj);
            TempData.Keep();

        }

        public IActionResult OnPost()
        {

            var claimsIdentity = (ClaimsIdentity)this.User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);

            ShoppingCartObj = TempData.Get<partnerJobViewModel>("itemSelected");

            var id = ShoppingCartObj.OrderHeader.Id;

            OrderHeader OrderHeader2 = _unitOfWork.OrderHeader.GetFirstOrDefault(c => c.Id == ShoppingCartObj.OrderHeader.Id);



            ShoppingCartObj.OrderDetails = _unitOfWork.OrderDetails.GetFirstOrDefault(c => c.Id == id);
            ShoppingCartObj.OrderHeader = _unitOfWork.OrderHeader.GetFirstOrDefault(c => c.Id == id);
            ShoppingCartObj.ApplicationUser = _unitOfWork.ApplicationUser.GetUserById(OrderHeader2.UserId);
            ShoppingCartObj.County = _unitOfWork.County.GetFirstOrDefault(o => o.Id == OrderHeader2.ApplicationUser.CountyId);

            

            ShoppingCartObj.OrderDetails.PartnerId = claim.Value;
            ShoppingCartObj.OrderHeader.Status = StaticDetails.StatusInProcess;


            _unitOfWork.OrderDetails.Update(ShoppingCartObj.OrderDetails);
            _unitOfWork.OrderHeader.Update(ShoppingCartObj.OrderHeader);

            _unitOfWork.Save();

            return RedirectToPage("/Partner/Jobs/JobConfirmation", new { id = ShoppingCartObj.OrderHeader.Id });
          

        }
    }
}
