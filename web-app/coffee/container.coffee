class MapContainer

    constructor: (@map, @scope) ->
        @prefix = infra_map.uniqueId()
        @_behaviours = []
        @_behaviourTypes = []

    add: (behaviourType, additionalArguments...) ->
        if behaviourType in @_behaviourTypes
            throw new Error 'Attempt to add duplicate behaviour'

        behaviour = new behaviourType @map, @scope, @prefix, additionalArguments...
        @_behaviours.push behaviour
        @_behaviourTypes.push behaviour.constructor

    attach: (behaviourType) ->
        if behaviourType not in @_behaviourTypes
            throw new Error 'Attempt to attach unexisting behaviour'

        behaviour = @_getBehaviour behaviourType
        behaviour.attach()

    detach: (behaviourType) ->
        if behaviourType not in @_behaviourTypes
            throw new Error 'Attempt to detach unexisting behaviour'

        behaviour = @_getBehaviour behaviourType
        behaviour.detach()

    on: (event, callback) ->
        prefixedEvent = infra_map.createPrefixedEvent event, @prefix
        @scope.$on prefixedEvent, callback

    emit: (event, parameters...) ->
        prefixedEvent = infra_map.createPrefixedEvent event, @prefix
        @scope.$broadcast event, parameters...

    behavesAs: (behaviourType) ->
        behaviourType in @_behaviourTypes

    _getBehaviour: (behaviourType) ->
        for behaviour in @_behaviours
            if behaviour.constructor == behaviourType
                return behaviour


infra_map.namespace (exports) ->
    exports.MapContainer = MapContainer
