using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;

namespace Job_Outsourcer.DataAccess.Data.Repository
{
    public class JobTypeRepository : Repository<JobType>, IJobTypeRepository
    {
        private readonly ApplicationDbContext _db;
        public JobTypeRepository(ApplicationDbContext db)
            : base(db)
        {
            _db = db;
        }

        public IEnumerable<SelectListItem> GetJobTypeListForDropDown()
        {
            return _db.JobType.Select(i => new SelectListItem()
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
        }


        public void Update(JobType objectToBeUpdated)
        {
            var categoryFromDb = _db.JobType.FirstOrDefault(s => s.Id == objectToBeUpdated.Id);
            categoryFromDb.Name = objectToBeUpdated.Name;
            categoryFromDb.CategoryId = objectToBeUpdated.CategoryId;
            _db.SaveChanges();
        }

    }
}
