/**
 * Created by 218023846 on 11/28/13.
 */
angular.module("common").service('events', function($rootScope) {

    this.subscribeToEvent = function(scope, eventName, handler){


             scope.$on(eventName, function(event, eventArguments){
                // note that the handler is passed the problem domain parameters

                handler(eventArguments);


            });


    }

    this.publishEvent = function(eventName, payload) {
        // ... loads the track and plays it
        // broadcast 'trackLoaded' event when done
        $rootScope.$broadcast(eventName, payload);
    };
});
