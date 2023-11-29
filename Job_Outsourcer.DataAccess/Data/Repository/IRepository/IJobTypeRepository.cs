using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Text;
using Job_Outsourcer.Models;

namespace Job_Outsourcer.DataAccess.Data.Repository.IRepository
{
    public interface IJobTypeRepository : IRepository<JobType>
    {
        IEnumerable<SelectListItem> GetJobTypeListForDropDown();

        void Update(JobType JobType);
    }
}
