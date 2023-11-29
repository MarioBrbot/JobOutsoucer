using Job_Outsourcer.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Repository.IRepository
{
    public interface IOrderDetailsRepository : IRepository<OrderDetails>
    {
        void Update(OrderDetails orderDetails);

        OrderDetails GetById(int id);
    }
}
