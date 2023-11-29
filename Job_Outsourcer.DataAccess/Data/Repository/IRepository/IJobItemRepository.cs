using System;
using System.Collections.Generic;
using System.Text;
using Job_Outsourcer.Models;

namespace Job_Outsourcer.DataAccess.Data.Repository.IRepository
{
  public  interface IJobItemRepository : IRepository<JobItem>
    {
        void Update(JobItem jobItem);
    }
}
