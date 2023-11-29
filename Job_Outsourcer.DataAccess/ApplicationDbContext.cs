using Job_Outsourcer.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Job_Outsourcer.DataAccess
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Category> Category { get; set; }
        public DbSet<JobType> JobType { get; set; }

        public DbSet<JobItem> JobItem { get; set; }

        public DbSet<ApplicationUser> ApplicationUser { get; set; }

        public DbSet<OrderHeader> OrderHeader { get; set; }
        public DbSet<OrderDetails> OrderDetails { get; set; }

        public DbSet<County> County { get; set; }

        public DbSet<Request> Request { get; set; }

        public DbSet<Rating> Rating { get; set; }

        public DbSet<PartnerRights> PartnerRights { get; set; }

    }
}
