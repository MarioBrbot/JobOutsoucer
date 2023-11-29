using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Text;


namespace Job_Outsourcer.DataAccess.Data.Repository
{
    public class UnitOfWork : IUnitOfWork
    {

        private readonly ApplicationDbContext _db;

        public UnitOfWork(ApplicationDbContext db)
        {
            _db = db;
            Category = new CategoryRepository(_db);
            JobType = new JobTypeRepository(_db);
            JobItem = new JobItemRepository(_db);
            ApplicationUser = new ApplicationUserRepository(_db);
            OrderHeader = new OrderHeaderRepository(_db);
            OrderDetails = new OrderDetailsRepository(_db);
            County = new CountyRepository(_db);
            Request = new RequestRepository(_db);
            Rating = new RatingRepository(_db);
            PartnerRights = new PartnerRightsRepository(_db);
        }

        public ICategoryRepository Category { get; private set; }

        public IJobTypeRepository JobType { get; private set; }

        public IJobItemRepository JobItem { get; private set; }

        public IApplicationUserRepository ApplicationUser { get; private set; }

        public IOrderDetailsRepository OrderDetails { get; private set; }

        public IOrderHeaderRepository OrderHeader { get; private set; }

        public ICountyRepository County { get; private set; }

        public IRequestRepository Request { get; private set; }

        public IRatingRepository Rating { get; private set; }


        public IPartnerRightsRepository PartnerRights { get; private set; }


        public void Dispose()
        {
            _db.Dispose();
        }

        public void Save()
        {
            _db.SaveChanges();
        }
    }
}
