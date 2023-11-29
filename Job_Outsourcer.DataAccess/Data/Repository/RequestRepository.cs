using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Repository
{
   public class RequestRepository : Repository<Request>, IRequestRepository
    {
        private readonly ApplicationDbContext _db;

        public RequestRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        public void Update(Request request)
        {
            var requestFromDb = _db.Request.FirstOrDefault(m => m.Id == request.Id);
            requestFromDb.Status = request.Status;
            _db.Request.Update(requestFromDb);

            _db.SaveChanges();

        }


    }
}
