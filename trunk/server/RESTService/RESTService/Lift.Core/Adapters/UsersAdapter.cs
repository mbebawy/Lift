using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Lift.Core.Models;
using Lift.Core.DataAccess;

namespace Lift.Core.Adapters
{
    public static class UsersAdapter
    {
        public static UserModel ToClientUser(User_Get_Result user)
        {
            UserModel u = new UserModel()
            {
                FirstName = user.FirstName,
                LastName = user.LastName,
                UserId = user.Id,
                PlaceOfBirth = user.PlaceOfBirth,
                DateOfBirth = (DateTime)user.DOB,
                Email = user.Email,
                MainPhone = user.PhoneNumber
            };
            return u;
        }
    }
}
