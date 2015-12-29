using Lift.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lift.Core.ServiceRequests
{
    public class PostUsersRequest
    {
        public string Keywords { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool IsUpdate { get; set; }
        public UserModel User { get; set; }
    }
}
