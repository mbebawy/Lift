﻿using Lift.Core.Models;
using Lift.Core.Repostories;
using Lift.Core.ServiceRequests;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Threading;
using System.Web.Http;

namespace RESTService.Controllers
{
    [RoutePrefix("api/Users")]
    public class UsersController : ApiController
    {
        UsersRepository _repo = new UsersRepository();
        private UserManager<IdentityUser> _userManager;
        [HttpPost]
        [Authorize]
        public List<UserModel> GetUsers(GetUsersRequest request)
        {
            
            var identity = User.Identity;
            

            return _repo.GetUsers(request);
        }
    }
}