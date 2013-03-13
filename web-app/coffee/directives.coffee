module = angular.module 'infra-map.directives', []

module.directive 'sleepyMap', ->

    defaultParameters =
        initialCenter: [59.943, 30.305]
        initialZoom: 13

    restrict: 'E'
    template: '<div></div>'
    replace: true

    link: (scope, element, attributes) ->

        scope.prepareParameters = ->
            if attributes.parameters
                scope.parameters = scope.$eval attributes.parameters
            else
                scope.parameters = defaultParameters

            if attributes.init
                scope.delegateInit = scope.$eval attributes.init
            else
                scope.delegateInit = ->

        scope.initialize = ->
            factory = new infra_map.LeafletMapFactory scope.parameters
            map = factory.createMap element[0]
            scope.container = new infra_map.MapContainer map, scope
            scope.container.add infra_map.BasicBehaviour
            scope.container.attach infra_map.BasicBehaviour


        scope.prepareParameters()
        scope.initialize()
        scope.delegateInit(scope.container)
