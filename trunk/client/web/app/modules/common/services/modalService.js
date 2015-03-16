/**
 * Created by mbebawy on 12/29/13.
 */
angular.module("common").service("modalService",["$modal", function($modal){
    var self = this;

    self.showNotesModal = function(callBack){
        var modalInstance = $modal.open({
            templateUrl: 'modules/common/views/notesModalView.html',
            controller: 'notesModalCtrl',
            resolve: {
            }
        });

        modalInstance.result.then(function (notes) {
           if(callBack !== undefined && callBack != null){
               callBack(notes);
           }

        }, function () {

        });
    };
    self.showConfigModal = function(callBack){
        var modalInstance = $modal.open({
            templateUrl: 'modules/common/views/configsModalView.html',
            controller: 'configsModalCtrl',
            resolve: {
            }
        });

        modalInstance.result.then(function () {
            if(callBack !== undefined && callBack != null){
                callBack();
            }

        }, function () {

        });
    };
    self.showNotificationModal = function(message){
        var modalInstance = $modal.open({
            templateUrl: 'modules/common/views/notificationModalView.html',
            controller: 'notificationsModalCtrl',
            resolve: {
                message: function(){
                    return message;
                }
            }
        });

        modalInstance.result.then(function () {

        }, function () {

        });
    };


}]);
