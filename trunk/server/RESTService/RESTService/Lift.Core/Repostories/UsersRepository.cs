using Lift.Core.Adapters;
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

        public List<UserModel> GetUsers(GetUsersRequest req, Guid currentUser)
        {
            var users = new List<UserModel>();
            using (var _db = new CoreEntities())
            {
               users = (from u in _db.User_Get(req.FirstName, req.LastName,null, null, null, null, null)
                       select UsersAdapter.ToClientUser(u)).ToList();

               
            }
            return users;
        }

        public void CreateUser(UserModel user, Guid currentUserId)
        {
            using(var _db = new CoreEntities()){
                using (var dbContextTransaction = _db.Database.BeginTransaction())
                {
                    try
                    {
                        _db.User_Add(user.UserId, user.FirstName, user.LastName, user.MiddleName, user.DateOfBirth, user.PlaceOfBirth, currentUserId, Guid.NewGuid(), user.Address1,user.Address2,
                            user.City, user.State, user.Zip, user.Zip);

                        if(user.Phones != null){
                            foreach(var phone in user.Phones){
                                _db.User_Add_Phone(user.UserId, currentUserId, phone.PhoneNumber, phone.PhoneType, phone.Description);
                            }
                        }
                        if (user.Occupations != null)
                        {
                            foreach (var oc in user.Occupations)
                            {
                                _db.User_Add_Occupation(user.UserId, currentUserId, Guid.NewGuid(), oc,"", DateTime.Now, DateTime.Now, true);
                            }
                        }

                        dbContextTransaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        dbContextTransaction.Rollback();
                    }
                }    
            }
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
