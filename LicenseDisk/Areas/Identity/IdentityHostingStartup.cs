using System;
using LicenseDisk.Areas.Identity.Data;
using LicenseDisk.Data;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

[assembly: HostingStartup(typeof(LicenseDisk.Areas.Identity.IdentityHostingStartup))]
namespace LicenseDisk.Areas.Identity
{
    public class IdentityHostingStartup : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((context, services) => {
                services.AddDbContext<LicenseDbContext>(options =>
                    options.UseSqlServer(
                        context.Configuration.GetConnectionString("LicenseDbContextConnection")));

                services.AddDefaultIdentity<LicenseUser>(options =>
                {
                    options.SignIn.RequireConfirmedAccount = false;
                    options.Password.RequireLowercase = false;
                    options.Password.RequireUppercase = false;
                    })
                    .AddEntityFrameworkStores<LicenseDbContext>();
            });
        }
    }
}