angular.module("common").service("baseService", ["$http", "security", "util", "$q", function ($http, security, util, $q) {
    "use strict";
    var self = this;
    self.callBacks = [];
    self.getRequest = function (resourceName, id) {
        var callId = util.getGuid();
       
        var url = null;
        if (id !== undefined && id !== null) {
            url = security.baseUrl + resourceName+ "/"+id;
        }
        else {
            url = security.baseUrl + resourceName;
        }
        var config = {
            headers: {
                'Authorization' : "Bearer ",
                'Accept' : '*/*',
                 Token: security.activeUser.token
            },
                contentType: 'application/json'
            };

         var deferred = $q.defer();
        
         $http({
            url: url + "##" + callId,
            method: "GET",
            headers: {'Content-Type': 'application/json', "Token": security.activeUser.token}
        }).success(function (data, status, headers, config) {
             
              
                 deferred.resolve(data);
              
            }).error(function (data, status, headers, config) {
               var retCallId = self.getCallId(config.url);
             	deferred.reject(status);
              
            });
             return deferred.promise;
        
        
    }

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
    }
    self.getToken = function(data, callBack){
        var deferred = $q.defer();
        var callId = util.getGuid();
        data.grant_type = "password"

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
            headers: {'Content-Type': 'application/x-www-form-urlencoded', 'grant_type' : 'password', "Token": security.activeUser.token}
        }).success(function (data, status, headers, config) {
               
                deferred.resolve(data);
            }).error(function (data, status, headers, config) {
                deferred.reject(status);
            });
        return deferred.promise;		
        
        
    };
    self.putRequest = function(resourceName, data, callBack){
   
         var callId = util.getGuid();
        
        self.callBacks.push({callId: callId, callBack: callBack});
        
        var url = security.baseUrl + resourceName;
      
        var config = {headers: {
                'Authorization' : "Bearer ",
                'Accept' : '*/*'
            },
                contentType: 'application/json'
            };
        
         $http({
            url: url+"##" + callId,
            method: "PUT",
            data: data,
            headers: {'Content-Type': 'application/json', "Token": security.activeUser.token}
        }).success(function (data, status, headers, config) {
               var retCallId = self.getCallId(config.url);
             
                for(var i in self.callBacks)
                {
                    if(self.callBacks[i].callId === retCallId)
                    {
                        self.callBacks[i].callBack(data, null);
                        self.callBacks.splice(i, 1);
                        break;
                    }
                }
            }).error(function (data, status, headers, config) {
             
                var retCallId = self.getCallId(config.url);
             
                for(var i in self.callBacks)
                {
                    if(self.callBacks[i].callId === retCallId)
                    {
                        self.callBacks[i].callBack(null, status);
                        self.callBacks.splice(i, 1);
                        break;
                    }
                }
            });
        
        
    }
   self.deleteRequest = function(resourceName, id, callBack){
       
        var callId = util.getGuid();
        self.callBacks.push({callId: callId, callBack: callBack});
        var url = security.baseUrl + resourceName;
      
        var config = {headers: {
                'Authorization' : "Bearer ",
                'Accept' : '*/*'
            },
                contentType: 'application/json'
            };
        
         $http({
            url: url +"/" + id+"##" + callId,
            method: "DELETE",           
            headers: {'Content-Type': 'application/json', "Token": security.activeUser.token}
        }).success(function (data, status, headers, config) {
              var retCallId = self.getCallId(config.url);
             
                for(var i in self.callBacks)
                {
                    if(self.callBacks[i].callId === retCallId)
                    {
                        self.callBacks[i].callBack(data, null);
                        self.callBacks.splice(i, 1);
                        break;
                    }
                }
            }).error(function (data, status, headers, config) {
                var retCallId = self.getCallId(config.url);
             
                for(var i in self.callBacks)
                {
                    if(self.callBacks[i].callId === retCallId)
                    {
                        self.callBacks[i].callBack(null, status);
                        self.callBacks.splice(i, 1);
                        break;
                    }
                }
            });

        
        
    }

   
        
       

}]);