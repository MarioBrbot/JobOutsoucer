
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Logging;
using Job_Outsourcer.Models;
using Job_Outsourcer.Utility;

namespace Job_Outsourcer.Pages.Admin.Home
{
    [AllowAnonymous]
    public class IndexModel : PageModel
    {

        
            private readonly SignInManager<IdentityUser> _signInManager;
            private readonly UserManager<IdentityUser> _userManager;
            private readonly ILogger<IndexModel> _logger;
            private readonly IEmailSender _emailSender;
            private readonly RoleManager<IdentityRole> _roleManager;

            public IndexModel(
                UserManager<IdentityUser> userManager,
                SignInManager<IdentityUser> signInManager,
                ILogger<IndexModel> logger,
                IEmailSender emailSender,
                RoleManager<IdentityRole> roleManager)
            {
                _userManager = userManager;
                _signInManager = signInManager;
                _logger = logger;
                _emailSender = emailSender;
                _roleManager = roleManager;
            }

            [BindProperty]
            public InputModel Input { get; set; }

            public string ReturnUrl { get; set; }

            public IList<AuthenticationScheme> ExternalLogins { get; set; }

            public class InputModel
            {
                [Required(ErrorMessage = " Email polje nije popunjeno")]
                [EmailAddress]
                [Display(Name = "Email")]
                public string Email { get; set; }

                [Required(ErrorMessage = " Lozinka polje nije popunjeno")]
                [StringLength(100, ErrorMessage = " {0} mora biti najmanje {2} i najviše {1} znakova dugacko.", MinimumLength = 6)]
                [DataType(DataType.Password)]
                [Display(Name = "Password")]
                public string Password { get; set; }

                [DataType(DataType.Password)]
                [Display(Name = "Confirm password")]
                [Compare("Password", ErrorMessage = "Lozinke se ne podudaraju")]
                public string ConfirmPassword { get; set; }


                [Required(ErrorMessage = " Ime polje nije popunjeno")]
                public string FirstName { get; set; }
                [Required(ErrorMessage = " Prezime polje nije popunjeno")]
                public string LastName { get; set; }

                [Required(ErrorMessage = " Kontakt broj polje nije popunjeno")]
                public string PhoneNumber { get; set; }

           
            public string Address { get; set; }

            

            public int CountyId { get; set; }

        }

            public async Task OnGetAsync(string returnUrl = null)
            {
                ReturnUrl = returnUrl;
                ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
            }

            public async Task<IActionResult> OnPostAsync(string returnUrl = null)
            {
                string role = StaticDetails.Admin;

                returnUrl = returnUrl ?? Url.Content("~/");
                ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
                if (ModelState.IsValid)
                {
                    var user = new ApplicationUser
                    {
                        UserName = Input.Email,
                        Email = Input.Email,
                        FirstName = Input.FirstName,
                        LastName = Input.LastName,
                        PhoneNumber = Input.PhoneNumber,
                        Address = "x",
                        CountyId = 1
                    };



                    var result = await _userManager.CreateAsync(user, Input.Password);
                    //jednom se izvrsi da dodamo role
                    if (!await _roleManager.RoleExistsAsync(StaticDetails.Admin))
                    {
                        _roleManager.CreateAsync(new IdentityRole(StaticDetails.Admin)).GetAwaiter().GetResult();
                        _roleManager.CreateAsync(new IdentityRole(StaticDetails.Customer)).GetAwaiter().GetResult();
                        _roleManager.CreateAsync(new IdentityRole(StaticDetails.Partner)).GetAwaiter().GetResult();
                    }

                    if (result.Succeeded)
                    {
                        
                        
                          
                                await _userManager.AddToRoleAsync(user, StaticDetails.Admin);
                                return RedirectToPage("/Admin/Home/Index");







                    }
                    foreach (var error in result.Errors)
                    {
                        ModelState.AddModelError(string.Empty, error.Description);
                    }
                }

                // ako je dovde došlo -  u pitanju je greška, redisplej forme
                return Page();
            }
        }
    }

