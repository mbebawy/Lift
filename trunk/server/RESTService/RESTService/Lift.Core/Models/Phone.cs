using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lift.Core.Models
{
    public class Phone
    {
        public int PhoneId { get; set; }
        public bool IsPrimaryPhone { get; set; }
        public string PhoneType { get; set; }
        public string Description { get; set; }
        public string PhoneNumber { get; set; }
    }
}
