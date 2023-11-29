using System;
using System.Collections.Generic;
using System.Text;

namespace Job_Outsourcer.Models.ViewModels
{
    public class partnerJobViewModel
    {
        public OrderHeader OrderHeader { get; set; }
        public OrderDetails OrderDetails { get; set; }

        public ApplicationUser ApplicationUser { get; set; }

        public County County { get; set; }


    }
}
