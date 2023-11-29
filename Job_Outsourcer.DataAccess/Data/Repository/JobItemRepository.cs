using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Job_Outsourcer.DataAccess;
using Job_Outsourcer.DataAccess.Data.Repository;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;

namespace Job_Outsourcer.DataAccess.Data.Repository
{
    public class JobItemRepository : Repository<JobItem>, IJobItemRepository
    {
        private readonly ApplicationDbContext _db;

        public JobItemRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        public void Update(JobItem jobItem)
        {
            var jobItemFromDb = _db.JobItem.FirstOrDefault(m => m.Id == jobItem.Id);

            jobItemFromDb.Name = jobItem.Name;
            jobItemFromDb.Description = jobItem.Description;
            jobItemFromDb.JobTypeId = jobItem.JobTypeId;
            jobItemFromDb.Price = jobItem.Price;
            if (jobItem.Image != null)
            {
                jobItemFromDb.Image = jobItem.Image;
            }
            _db.SaveChanges();

        }
    }
}