﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lift.Core.Models
{
    public class Email
    {
        public Guid? EmailId { get; set; }
        public string EmailAddress { get; set; }
        public string EmailType { get; set; }
    }
}
