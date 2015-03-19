using Lift.Core.DataAccess;
using Lift.Core.Models;
using Lift.Core.ServiceRequests;
using System;
using System.Collections.Generic;
using System.Linq;
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

        public void Dispose()
        {
            if (_db != null)
                _db.Dispose();
        }
    }
}
