using Job_Outsourcer.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Repository.IRepository
{
    public interface ICountyRepository : IRepository<County>
    {
        IEnumerable<SelectListItem> GetCountyListForDropDown();
    }
}
