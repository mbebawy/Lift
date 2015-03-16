angular.module("common").service("security", [function(){
    'user strict';
    var self = this;
    //var server = "24.62.238.189";
    var server = "bebawy-pc";
    self.publicUser = {
        userId: "7d0859f2-640f-4360-a0d0-113aa7c0b549",
        token: null

    };
    self.activeUser = angular.copy(self.publicUser);
    self.userId = "7d0859f2-640f-4360-a0d0-113aa7c0b549";
    self.baseUrl = "https://" + server + "/RESTService/api/";
    self.imagesBaseUrl = "https://" + server + "/RESTService//";

 //self.baseUrl ="http://localhost/restService1/api/";
/*self.baseUrl ="http://bebawy-pc/restService/api/";*/

  // this.baseUrl ="http://localhost/restService/api/";

    self.hasClaim = function(claimId){
        var hasClaim = false;
        if(self.activeUser!== null && self.activeUser.claims !== undefined){
            for(var i in self.activeUser.claims){
                if(self.activeUser.claims[i].id === claimId){
                    hasClaim = true;
                    break;
                }
            }
        }
        return hasClaim;
    };
}]);