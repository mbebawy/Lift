/**
 * Created by MINA on 11/3/2014.
 */
angular.module("common").directive('spinner', function () {
   "use strict"
    return {
        restrict: 'A',
        replace: true,
        transclude: true,
        scope: {
            loading: '=showBusy',
            leftMargin: '=leftMargin'
        },
        template: '<div><div ng-show="loading" class="my-loading-spinner-container"></div> <div ng-hide="loading" ng-transclude></div></div>',
        link: function(scope, element, attrs) {
            var opts = {
                lines: 13, // The number of lines to draw
                length: 15, // The length of each line
                width: 7, // The line thickness
                radius: 20, // The radius of the inner circle
                corners: 1, // Corner roundness (0..1)
                rotate: 0, // The rotation offset
                direction: 1, // 1: clockwise, -1: counterclockwise
                color: '#000', // #rgb or #rrggbb or array of colors
                speed: 1, // Rounds per second
                trail: 60, // Afterglow percentage
                shadow: false, // Whether to render a shadow
                hwaccel: false, // Whether to use hardware acceleration
                className: 'spinner', // The CSS class to assign to the spinner
                zIndex: 2e9, // The z-index (defaults to 2000000000)
                top: '50%', // Top position relative to parent
                left: scope.leftMargin//'57.5%' // Left position relative to parent
            };
            var spinner = new Spinner(opts).spin();
            var loadingContainer = element.find('.my-loading-spinner-container')[0];

            loadingContainer.appendChild(spinner.el);

        }
    };
});
