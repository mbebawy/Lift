using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Lift.Core.Models
{
    public class UserModel
    {
        public Nullable<System.Guid> UserId { get; set; }
        public string UserName { get; set; }       
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Country { get; set; }
        
        public DateTime DateOfBirth { get; set; }
        public List<string> Occupations { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public Nullable<System.Guid> CreateUserId { get; set; }
        public Nullable<System.Guid> UpdateUserId { get; set; }
        public Nullable<int> UserTypeId { get; set; }
     
        public Nullable<int> RoleId { get; set; }
        public List<Claim> Claims { get; set; }
        public string PlaceOfBirth { get; set; }
        
        public List<Phone> Phones { get; set; }
        public List<Email> Emails { get; set; }
        public string Email { get; set; }
        public string MainPhone { get; set; }
        
    }
}
