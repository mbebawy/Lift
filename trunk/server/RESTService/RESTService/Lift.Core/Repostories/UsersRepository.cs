using Lift.Core.DataAccess;
using Lift.Core.Models;
using Lift.Core.ServiceRequests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Lift.Core.Repostories
{
    public class UsersRepository: IDisposable
    {
        private CoreEntities _db;

        public List<UserModel> GetUsers(GetUsersRequest req)
        {
            var users = new List<UserModel>();
            users.Add(new UserModel
            {
                FirstName = "Mina",
                LastName = "Botros"
            });
            return users;
        }

        public void CreateUser(UserModel user)
        {
            //Add to Address
            //Add to Profile
            // Add to Phone


        }
        public void CreateClaim(Claim claim)
        {

        }
        public void CreateUserMapping(Guid ParentUserID, Guid ChildUserID)
        {

        }

        public void UpdateUser(UserModel user)
        {

        }
        public void UpdateClaim(Claim claim)
        {

        }
        public void RemoveUserMapping(Guid ParentUserID, Guid ChildUserID)
        {

        }

        public void Dispose()
        {
            if (_db != null)
                _db.Dispose();
        }
    }
}
