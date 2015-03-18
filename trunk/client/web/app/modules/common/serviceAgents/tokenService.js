angular.module('common').service("tokenService", ["baseService", "$q", function(baseService,$q){
	var self = this;

	self.getToken = function(userName, password){
		var deferred = $q.defer();

 		var data ={
		    Password: password,
		    UserName: userName
		};
		baseService.getToken(data).then(function(token){
 			deferred.resolve(token);
        }, function(error){
			deferred.reject(status);
        });

		return deferred.promise;
	};

}])