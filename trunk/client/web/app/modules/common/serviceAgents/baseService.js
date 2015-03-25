angular.module("common").service("baseService", ["$http", "security", "util", "$q", function ($http, security, util, $q) {
    "use strict";
    var self = this;
    var getHeaders = function(){
        var token =(security.token !== undefined && security.token !== null)? security.token.access_token: null;
        return {
            'Authorization': "Bearer "+ token,
            'Accept': '*/*',
            'Content-Type': 'application/json',
            'grant_type' : 'password'
        };
    };
    self.getRequest = function (resourceName, id) {
        var callId = util.getGuid();
        var url = null;
        if (id !== undefined && id !== null) {
            url = security.baseUrl + resourceName+ "/"+id;
        }
        else {
            url = security.baseUrl + resourceName;
        }
        var deferred = $q.defer();
        $http({
            url: url + "##" + callId,
            method: "GET",
            headers: getHeaders()
        }).success(function (data, status, headers, config) {
            deferred.resolve(data);
        }).error(function (data, status, headers, config) {
           var retCallId = self.getCallId(config.url);
            deferred.reject(status);
        });
        return deferred.promise;
    };

    self.getCallId = function(url){
        var str = url.split("##");
        if(str.length > 1)
        {
            return str[1];
        }
        else
        {
            return null;
        }
    };
    self.getToken = function(data, callBack){
        var deferred = $q.defer();
        var callId = util.getGuid();
        data.grant_type = "password";
        var url = security.baseUrl.replace("api/", "") +"token" ;
        $http({
            url: url +"##" + callId,
            method: "POST",
            data: data,
            headers: {'Content-Type': 'application/json'}, transformRequest: function (obj) {
                var str = [];
                for (var p in obj)
                    str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                return str.join("&");
            }
        }).success(function (token, status, headers, config) {

            deferred.resolve(token);
        }).error(function (data, status, headers, config) {
            deferred.reject(status);
        });
        return deferred.promise;
    };

    self.postRequest = function(resourceName, data, callBack){
        var deferred = $q.defer();
        var callId = util.getGuid();
        var url = security.baseUrl + resourceName ;
        $http({
            url: url +"##" + callId,
            method: "POST",
            data: data,
            headers: getHeaders()//{'Content-Type': 'application/x-www-form-urlencoded', 'grant_type' : 'password', "Token": security.activeUser.token}
        }).success(function (data, status, headers, config) {
               
                deferred.resolve(data);
            }).error(function (data, status, headers, config) {
                deferred.reject(status);
            });
        return deferred.promise;		
        
        
    };
    self.putRequest = function(resourceName, data, callBack){
   
        var callId = util.getGuid();
        var deferred = $q.defer();
        var url = security.baseUrl + resourceName;

        $http({
            url: url+"##" + callId,
            method: "PUT",
            data: data,
            headers: getHeaders()
        }).success(function (data, status, headers, config) {

                 deferred.resolve(data);
             }).error(function (data, status, headers, config) {
                 deferred.reject(status);
             });
        return deferred.promise;
        
        
    };
   self.deleteRequest = function(resourceName, id, callBack){
        var deferred = $q.defer();
        var callId = util.getGuid();
        self.callBacks.push({callId: callId, callBack: callBack});
        var url = security.baseUrl + resourceName;
        $http({
            url: url +"/" + id+"##" + callId,
            method: "DELETE",           
            headers: getHeaders()
        }).success(function (data, status, headers, config) {

                 deferred.resolve(data);
             }).error(function (data, status, headers, config) {
                 deferred.reject(status);
             });
       return deferred.promise;
    }

   
        
       

}]);