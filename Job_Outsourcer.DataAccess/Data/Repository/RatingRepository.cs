using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Repository
{
   public class RatingRepository : Repository<Rating>, IRatingRepository 
    {
       
            private readonly ApplicationDbContext _db;

            public RatingRepository(ApplicationDbContext db) : base(db)
            {
                _db = db;
            }

     
       


        


    }
}
