using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lift.Core.ServiceRequests
{
    public class GetUsersRequest
    {
        public string Keywords { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
