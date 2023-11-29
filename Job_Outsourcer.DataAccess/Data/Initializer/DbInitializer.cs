using Job_Outsourcer.Models;
using Job_Outsourcer.Utility;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Job_Outsourcer.DataAccess.Data.Initializer
{
    public class DbInitializer : IDbInitializer
    {
        private readonly ApplicationDbContext _db;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public DbInitializer(ApplicationDbContext db, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            _db = db;
            _roleManager = roleManager;
            _userManager = userManager;
        }


        public void Initialize()
        {
            try
            {
                if (_db.Database.GetPendingMigrations().Count() > 0)
                {
                    _db.Database.Migrate();
                }
            }
            catch (Exception ex)
            {
            }

            if (_db.Roles.Any(r => r.Name == StaticDetails.Admin)) return;

            _roleManager.CreateAsync(new IdentityRole(StaticDetails.Admin)).GetAwaiter().GetResult();
            _roleManager.CreateAsync(new IdentityRole(StaticDetails.Customer)).GetAwaiter().GetResult();
            _roleManager.CreateAsync(new IdentityRole(StaticDetails.Partner)).GetAwaiter().GetResult();

            _db.County.Add(new County { 
                Name = "Zagrebačka"
            });
            _db.County.Add(new County
            {
                Name = "Krapinsko-zagorska"
            });
            _db.County.Add(new County
            {
                Name = "Sisačko-moslavačka"
            });
            _db.County.Add(new County
            {
                Name = "Karlovačka"
            });
            _db.County.Add(new County
            {
                Name = "Varaždinska"
            });
            _db.County.Add(new County
            {
                Name = "Koprivničko-križevačka"
            });
            _db.County.Add(new County
            {
                Name = "Bjelovarsko-bilogorska"
            });
            _db.County.Add(new County
            {
                Name = "Primorsko-goranska"
            });
            _db.County.Add(new County
            {
                Name = "Ličko-senjska"
            });
            _db.County.Add(new County
            {
                Name = "Virovitičko-podravska"
            });
            _db.County.Add(new County
            {
                Name = "Požeško-slavonska"
            });
            _db.County.Add(new County
            {
                Name = "Brodsko-posavska"
            });
            _db.County.Add(new County
            {
                Name = "Zadarska"
            });
            _db.County.Add(new County
            {
                Name = "Šibensko-kninska"
            });
            _db.County.Add(new County
            {
                Name = "Vukovarsko-srijemska"
            });
            _db.County.Add(new County
            {
                Name = "Istarska"
            });
            _db.County.Add(new County
            {
                Name = "Dubrovačko-neretvanska"
            });
            _db.County.Add(new County
            {
                Name = "Međimurska"
            });
            _db.County.Add(new County
            {
                Name = "Grad Zagreb"
            });
            _db.County.Add(new County
            {
                Name = "Osječko-baranjska"
            });
            _db.County.Add(new County
            {
                Name = "Splitsko-dalmatinska"
            });

            _db.SaveChanges();

            _userManager.CreateAsync(new ApplicationUser
            {
                UserName = "admin@gmail.com",
                Email = "admin@gmail.com",
                FirstName = "Mario",
                LastName = "Brbot",
                EmailConfirmed = true,
                PhoneNumber = "123456789",
                Address = "x",
                CountyId = 1
                    }, "Admin1!").GetAwaiter().GetResult();

            ApplicationUser user = _db.ApplicationUser.Where
                (u => u.Email == "admin@gmail.com").FirstOrDefault();

            _userManager.AddToRoleAsync(user, StaticDetails.Admin).GetAwaiter().GetResult();



            _userManager.CreateAsync(new ApplicationUser
            {
                UserName = "partner@gmail.com",
                Email = "partner@gmail.com",
                FirstName = "Ivan",
                LastName = "Horvat",
                EmailConfirmed = true,
                PhoneNumber = "823456789",
                Address = "Ulica Domovine 1",
                CountyId = 1
            }, "Admin1!").GetAwaiter().GetResult();

            user = _db.ApplicationUser.Where
                (u => u.Email == "partner@gmail.com").FirstOrDefault();

            _userManager.AddToRoleAsync(user, StaticDetails.Partner).GetAwaiter().GetResult();
        }


    }
}
