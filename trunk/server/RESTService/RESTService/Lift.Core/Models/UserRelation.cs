using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lift.Core.Models
{
    public class UserRelation
    {
        public Guid ToUserId { get; set; }
        public Guid FromUserId { get; set; }
        public string Type { get; set; }
        public UserModel User { get; set; }
    }
}
