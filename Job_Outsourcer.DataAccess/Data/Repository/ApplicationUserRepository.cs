
using Job_Outsourcer.DataAccess.Data.Repository.IRepository;
using Job_Outsourcer.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Repository
{
    public class ApplicationUserRepository : Repository<ApplicationUser>, IApplicationUserRepository
    {
        private readonly ApplicationDbContext _db;

        public ApplicationUserRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        public ApplicationUser GetUserById(string id)
        {
            return dbSet.Find(id);
        }

        public List<ApplicationUser> GetUsersByRole(string role)
        {

            IdentityRole roleWanted = (IdentityRole)_db.Roles.FirstOrDefault(m => m.Name == role);

            var set = _db.UserRoles.Where(m => m.RoleId == roleWanted.Id);

            List<ApplicationUser> users = new List<ApplicationUser>();




            foreach (IdentityUserRole<string> item in set)
            {
                ApplicationUser user = (ApplicationUser)_db.Users.FirstOrDefault(m => m.Id == item.UserId);

                users.Add(user);

            }

            return users;
        }


    

        public void UpdateUser(ApplicationUser user, string id)
        {

           
            var objFromDB = _db.ApplicationUser.FirstOrDefault(s => s.Id == id);


            objFromDB.FirstName = user.FirstName;
            objFromDB.LastName = user.LastName;
            objFromDB.Email = user.Email;
            objFromDB.PhoneNumber = user.PhoneNumber;
            objFromDB.Address = user.Address;
            objFromDB.CountyId = user.CountyId;
            

            _db.ApplicationUser.Update(objFromDB);

            _db.SaveChanges();

        }



        public string GetUserIdRole(string role)
        {

            IdentityRole roleWanted = (IdentityRole)_db.Roles.FirstOrDefault(m => m.Name == role);

            var set = _db.UserRoles.Where(m => m.RoleId == roleWanted.Id);

            ApplicationUser users = new ApplicationUser();




            foreach (IdentityUserRole<string> item in set)
            {

                 users = (ApplicationUser)_db.Users.FirstOrDefault(m => m.Id == item.UserId);

                

            }

            return users.Id;
        }
    }
}
