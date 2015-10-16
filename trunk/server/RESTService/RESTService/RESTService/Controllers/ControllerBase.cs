using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace RESTService.Controllers
{
    public class ControllerBase : ApiController
    {
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
    }
}
