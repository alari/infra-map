module = angular.module 'infra-map.directives', []

module.directive 'sleepyMap', ->
    restrict: 'E'
    template: '<div></div>'
    replace: true
    transclude: true

    scope:
        factory: '='
        delegateInit: '=init'
        parameters: '='

    link: (scope, element) ->

        scope.initialize = ->
            scope.factory = infra_map.LeafletMapFactory if not scope.factory
            scope.parameters = {initialCenter: [59.943, 30.305], initialZoom: 13} if not scope.parameters
            scope.delegateInit = (->) if not scope.delegateInit

        scope.initialize()
        factory = new scope.factory scope.parameters
        scope.map = factory.createMap element[0]
        scope.behaviour = new infra_map.BasicBehaviour scope.map, scope
        scope.behaviour.attach()
        scope.delegateInit(scope.map, scope)
