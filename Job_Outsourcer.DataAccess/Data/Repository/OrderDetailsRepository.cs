using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Repository
{
    public class OrderDetailsRepository : Repository<OrderDetails>, IOrderDetailsRepository
    {
        private readonly ApplicationDbContext _db;

        public OrderDetailsRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        public void Update(OrderDetails orderDetails)
        {
            var orderDetailsFromDb = _db.OrderDetails.FirstOrDefault(m => m.Id == orderDetails.Id);
            _db.OrderDetails.Update(orderDetailsFromDb);

            _db.SaveChanges();

        }

        public OrderDetails GetById(int id) {

            var order = _db.OrderDetails.FirstOrDefault(m => m.Id == id);

            return order;
        }
    }
}
