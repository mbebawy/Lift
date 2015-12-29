/**
 * Created by MINA on 3/18/2015.
 */
angular.module("common").service("usersServiceAgent", ["baseService","$q", function(baseService, $q){
    "use strict"
    var self = this;

    self.getUsers = function(args){
        var deferred = $q.defer();

        var data = {
            LastName: args.lastName,
            FirstName: args.firstName,
            IsUpdate: false,
            User: null

        };
        baseService.postRequest("Users", data).then(function(users){
            deferred.resolve(users);
        }, function(error){
            deferred.reject(status);
        });

        return deferred.promise;
    };
    self.createUser = function(user){
        var deferred = $q.defer();

        
        baseService.putRequest("Users", toServiceUser(user)).then(function(user){
            deferred.resolve(user);
        }, function(error){
            deferred.reject(status);
        });
        return deferred.promise;

    };
    self.updateUser = function(user){
        var deferred = $q.defer();
        var data = {
            LastName: null,
            FirstName: null,
            IsUpdate: true,
            User: toServiceUser(user)

        };
        
        baseService.postRequest("Users", data).then(function(user){
            deferred.resolve(user);
        }, function(error){
            deferred.reject(status);
        });
        return deferred.promise;
    }

    var toServiceUser = function(cu){
        var user = {
            UserId: cu.userId,
            UserName: cu.UserName,
            password: cu.password,
            FirstName:  cu.firstName,
            LastName : cu.lastName,
            MiddleName : cu.middleName,
            DateOfBirth : cu.dateOfBirth,
            Occupations: cu.occupations,
            IsActive: cu.isActive,       
            UserTypeId: cu.userTypeId,        
            RoleId: cu.roleId,        
            PlaceOfBirth: cu.placeOfBirth,        
            Phones: cu.phones,
            Emails: cu.emails,
            Email: cu.email,
            MainPhone: cu.mainPhone,
            DateOfBirth: cu.dateOfBirth,
            PlaceOfBirth: cu.placeOfBirth,
            Address: [],
            Emails: [],
            Phones: [],
            Relations: []
        };
        if(cu.address !== undefined && cu.address !== null ){
            for(var i in cu.address){
                user.Address.push(toServiceAddress(cu.address[i]));
            }
        }
        if(cu.emails !== undefined && cu.emails !== null){
            for(var i in cu.emails){
                user.Emails.push(toServiceEmail(cu.emails[i]));
            }
        }
        if(cu.phones !== undefined && cu.phones !== null){
            for(var i in cu.phones){
                user.Phones.push(toServicePhone(cu.phones[i]))
            }
        }
        if(cu.relations !== undefined && cu.relations !== null){
            for(var r in cu.relations){
                user.Relations.push(toServiceRelation(cu.relations[r]));
            }
        }
        return user;
    };
    var toServiceAddress = function(add){
        var address = {
            Id: add.id,
            Address1: add.address1,
            Address2: add.address2,
            Address3: add.address3,
            City: add.city,
            State: add.state,
            Zip: add.zip,
            Country: add.country
        };
        return address;
    };
    var toServiceEmail = function(em){
        var email = {
            EmailId: em.emailId,
            EmailAddress: em.emailAddress,
            EmailType: em.emailType
        }
        return email;
    };
    var toServicePhone = function(ph){
        var phone = {
            PhoneId: ph.phoneId,
            IsPrimaryPhone: ph.isPrimaryPhone,
            PhoneType: ph.phoneType,
            Description: ph.description,
            PhoneNumber: ph.phoneNumber
        };
        return phone;

    };
    var toServiceRelation = function(rel){
        var relation = {
            ChildId: rel.childId,
            ParentId: rel.parentId,
            Type: rel.type,
            User: null

        };
        return relation;
    }


 
}]);
