using System;
using System.Collections.Generic;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Repository.IRepository
{
    public interface IUnitOfWork : IDisposable
    {
        ICategoryRepository Category { get; }

        IJobTypeRepository JobType { get; }

        IJobItemRepository JobItem { get; }

        IApplicationUserRepository ApplicationUser { get; }

        IOrderHeaderRepository OrderHeader { get; }
        IOrderDetailsRepository OrderDetails { get; }

        ICountyRepository County { get; }

        IRequestRepository Request { get; }

        IRatingRepository Rating { get; }


        IPartnerRightsRepository PartnerRights { get; }
        void Save();

    }
}
