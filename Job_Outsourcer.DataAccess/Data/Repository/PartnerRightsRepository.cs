using System;
using System.Collections.Generic;
using System.Text;
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;

namespace Job_Outsourcer.DataAccess.Data.Repository
{
    public class PartnerRightsRepository : Repository<PartnerRights>, IPartnerRightsRepository
    {


        private readonly ApplicationDbContext _db;

        public PartnerRightsRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }


    }
}
