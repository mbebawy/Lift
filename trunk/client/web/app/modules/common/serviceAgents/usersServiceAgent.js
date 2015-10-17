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
            FirstName: args.firstName
        }
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

    var toServiceUser = function(cu){
        return {
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
            Address1: cu.address1,
            Address2: cu.address2,
            Address3: cu.address3,
            City: cu.city,
            State: cu.state,
            Zip: cu.zip,
            Country: cu.country,
            DateOfBirth: cu.dateOfBirth,
            PlaceOfBirth: cu.placeOfBirth
        };
    };
}]);
