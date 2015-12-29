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

        public List<UserModel> GetUsers(PostUsersRequest req, Guid currentUser)
        {
            var users = new List<UserModel>();
            using (var _db = new CoreEntities())
            {
               users = (from u in _db.User_Get(req.FirstName, req.LastName,null, null, null, null, null, currentUser)
                       select UsersAdapter.ToClientUser(u)).ToList();

                foreach(var user in users)
                {
                    var addresses = (from a in _db.UserAddress_GET(user.UserId)
                                     where a != null
                                     select AddressAdapter.toServiceAddress(a)
                                     ).ToList();
                    foreach(var ad in addresses)
                    {
                        if (ad != null)
                        {
                            user.Address.Add(ad);
                        }
                    }
                    var emails = (from e in _db.Email_Get(user.UserId)
                                  where e != null && e.Id != null
                                  select new Email()
                                  {
                                      EmailAddress = e.Email,
                                      EmailType = e.EmailType,
                                      EmailId = (Guid)e.Id
                                  }).ToList();
                    foreach(var em in emails)
                    {
                        if(em != null)
                        {
                            user.Emails.Add(em);
                        }
                    }

                    var phones = (from ph in _db.Phone_Get(user.UserId)
                                  where ph != null && ph.Id != null
                                  select new Phone()
                                  {
                                      PhoneId = (Guid)ph.Id,
                                      Description = ph.PhoneDescription,
                                      PhoneNumber = ph.PhoneNumber,
                                      PhoneType = ph.PhoneType,
                                      IsPrimaryPhone = true
                                  }).ToList();
                    foreach(var ph in phones)
                    {
                        if(ph != null)
                        {
                            user.Phones.Add(ph);
                        }
                    }
                    var ChildrenRelations = (from r in _db.UserRelations_Get(user.UserId, null)
                                     select new UserRelation()
                                     {
                                         ToUserId = (Guid)r.ToUserId,
                                         FromUserId = (Guid)r.FromUserId,
                                         Type = r.RelationType
                                     }).ToList();
                    foreach(var ch in ChildrenRelations)
                    {
                        ch.User = (from u in _db.User_Get(null, null, null, null, null, null, ch.ToUserId, currentUser)
                                            select UsersAdapter.ToClientUser(u)).FirstOrDefault();
                        user.Relations.Add(ch);
                        
                    }
                    
                    var parentsRelations = (from r in _db.UserRelations_Get(null, user.UserId)
                                             select new UserRelation()
                                             {
                                                 ToUserId = (Guid)r.ToUserId,
                                                 FromUserId = (Guid)r.FromUserId,
                                                 Type = r.RelationType
                                             }).ToList();

                    foreach (var prt in parentsRelations)
                    {
                        prt.User = (from u in _db.User_Get(null, null, null, null, null, null, prt.FromUserId, currentUser)
                                   select UsersAdapter.ToClientUser(u)).FirstOrDefault();
                        user.Relations.Add(prt);

                    }



                }

               
            }
            return users;
        }

        private object toServiceAddress(UserAddress_GET_Result a)
        {
            throw new NotImplementedException();
        }

        public void CreateUser(UserModel user, Guid currentUserId)
        {
            using(var _db = new CoreEntities()){
                using (var dbContextTransaction = _db.Database.BeginTransaction())
                {
                    try
                    {
                        _db.User_Add(user.UserId, user.FirstName, user.LastName, user.MiddleName, user.DateOfBirth, user.PlaceOfBirth, currentUserId);

                        if(user.Address != null && user.Address.Count > 0)
                        {
                            foreach(var add in user.Address)
                            {
                                _db.Address_Add(user.UserId, Guid.NewGuid(), add.Address1, add.Address2, add.City, add.State, add.Zip, add.Country);
                            }
                        }
                        if(user.Emails != null)
                        {
                            foreach(var email in user.Emails)
                            {
                                _db.Email_Add(user.UserId, Guid.NewGuid(), email.EmailAddress);
                            }
                        }
                        if(user.Phones != null){
                            foreach(var phone in user.Phones){
                                _db.User_Add_Phone(user.UserId,currentUserId, Guid.NewGuid(), phone.PhoneNumber, phone.PhoneType, phone.Description);
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

        public void UpdateUser(UserModel user, Guid currentUserId)
        {
            using (var _db = new CoreEntities())
            {
                using (var dbContextTransaction = _db.Database.BeginTransaction())
                {
                    try
                    {
                        _db.User_Update(user.UserId, user.FirstName, user.LastName, user.MiddleName, user.DateOfBirth, user.PlaceOfBirth, currentUserId);

                        if (user.Address != null && user.Address.Count > 0)
                        {
                            foreach (var add in user.Address)
                            {
                                _db.Address_Update(add.Id, add.Address1, add.Address2, add.City, add.State, add.Zip, add.Country);
                            }
                        }
                        if(user.Emails != null)
                        {
                            foreach (var email in user.Emails)
                            {
                                _db.Email_Update(email.EmailId, email.EmailAddress, email.EmailType, true);
                            }
                        }
                        if (user.Phones != null)
                        {
                            foreach (var phone in user.Phones)
                            {
                                if (phone.PhoneId == Guid.Empty)
                                {
                                    _db.User_Add_Phone(user.UserId, currentUserId, Guid.NewGuid(), phone.PhoneNumber, phone.PhoneType, phone.Description);
                                }
                                else
                                {
                                    _db.Phone_Update(phone.PhoneId, phone.PhoneNumber, phone.Description, phone.PhoneType);
                                }
                            }
                        }
                        /*
                      
                        if (user.Occupations != null)
                        {
                            foreach (var oc in user.Occupations)
                            {
                                _db.User_Add_Occupation(user.UserId, currentUserId, Guid.NewGuid(), oc, "", DateTime.Now, DateTime.Now, true);
                            }
                        }
                        */
                        dbContextTransaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        dbContextTransaction.Rollback();
                    }
                }
            }

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
