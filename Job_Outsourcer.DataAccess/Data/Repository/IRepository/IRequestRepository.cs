﻿using Job_Outsourcer.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Repository.IRepository
{
   public  interface IRequestRepository : IRepository<Request>
    {
        void Update(Request request);
    }
}
