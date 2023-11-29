using Job_Outsourcer.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Repository.IRepository
{
    public interface IApplicationUserRepository : IRepository<ApplicationUser>
    {
        ApplicationUser GetUserById(string userId);


        public List<ApplicationUser> GetUsersByRole(string role);

        public void UpdateUser(ApplicationUser user, string id);

        public string GetUserIdRole(string role);


    }
}
