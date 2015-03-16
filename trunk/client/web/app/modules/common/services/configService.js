/**
 * Created by mbebawy on 1/18/14.
 */
angular.module("common").service("configService", ["configServiceAgent", function(configServiceAgent){
    "use strict";
    var self = this;

    self.configs = [];
    self.clientTypes =["POS", "SITE"];
    self.clientType = self.clientTypes[0];
    self.const = function(){

    };
    self.getConfigs = function(){

        configServiceAgent.getConfigs(function(configs){
            self.configs = configs;

            self.taxRate = parseFloat(self.getValue("Tax Rate"));

        });
    };
    self.getValue = function(name){
        var value = "";
        for(var i in self.configs){
            if(name.toLocaleLowerCase() === self.configs[i].name.toLocaleLowerCase()){
                value = self.configs[i].value;
            }
        }
        return value;
    };
    self.updateConfigs = function(configs, callBack){
        configServiceAgent.updateConfigs(configs, function(){
            configServiceAgent.getConfigs(function(configs){
                self.configs = configs;

                self.taxRate = parseFloat(self.getValue("Tax Rate"));

            });
            callBack();
        });
    };

    self.taxRate = 0.00;

    self.const();
}]);
