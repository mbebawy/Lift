using Lift.Core.Models;
using Lift.Core.Repostories;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using RESTService.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;

namespace RESTService.Auth
{
    public class AuthRepository : IDisposable
    {
        private AuthContext _ctx;
        private UsersRepository _userRepo = null; 
        private UserManager<IdentityUser> _userManager;

        public Guid UserId
        {
            get
            {
                var c = HttpContext.Current.GetOwinContext();
                var ur = c.Authentication.User;
                var identity = ur.Identity;
                return new Guid(Microsoft.AspNet.Identity.IdentityExtensions.GetUserId(identity));
            }
        }

        public AuthRepository()
        {
            _userRepo = new UsersRepository();
            _ctx = new AuthContext();
            _userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>(_ctx));
        }

        public async Task<IdentityResult> RegisterUser(UserAuth userModel)
        {
            var userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>(_ctx));

            IdentityUser us = new IdentityUser
            {
                UserName = userModel.UserName,
                Id = userModel.UserId.ToString()
                
               
            };

            var result = userManager.Create(us, userModel.Password);


            UserAuth userRequest = new UserAuth()
            {
                UserId = new Guid(us.Id)
            };
            
            _userRepo.CreateUser(userModel, UserId);

            return result;
        }

        public async Task<IdentityUser> FindUser(string userName, string password)
        {
            IdentityUser user = await _userManager.FindAsync(userName, password);

            return user;
        }
        public async Task<IList<Claim>> GetClaims(string userId)
        {
           
            var claims = await _userManager.GetClaimsAsync(userId);

            return claims;
        }

        public void Dispose()
        {
            _ctx.Dispose();
            _userManager.Dispose();

        }
    }
}