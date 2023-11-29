using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Repository
{
    public class CountyRepository : Repository<County>, ICountyRepository
    {
        private readonly ApplicationDbContext _db;
        public CountyRepository(ApplicationDbContext db)
            : base(db)
        {
            _db = db;
        }

        public IEnumerable<SelectListItem> GetCountyListForDropDown()
        {
            return _db.County.Select(i => new SelectListItem()
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
        }
    }
}
