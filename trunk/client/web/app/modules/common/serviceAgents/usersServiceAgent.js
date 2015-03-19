/**
 * Created by MINA on 3/18/2015.
 */
angular.module("common").service("usersServiceAgent", ["baseService","$q", function(baseService, $q){
    "use strict"
    var self = this;

    self.getUsers = function(keywords){
        var deferred = $q.defer();

        var data = {
            Keywords: keywords
        }
        baseService.postRequest("Users", data).then(function(users){
            deferred.resolve(users);
        }, function(error){
            deferred.reject(status);
        });

        return deferred.promise;
    }
}]);
