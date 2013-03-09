class AbstractLeafletBehaviour

    @createPrefixedEvent: (event, prefix) ->
        if prefix
            "#{prefix}-#{event}"
        else
            event

    constructor: (@map, @scope, @prefix) ->
        @_attached = false

    isAttached: ->
        @_attached

    attach: ->
        @_attached = true
        @_doAttach?()

    detach: ->
        @_attached = false
        @_doDetach?()

    _emit: (event, parameters...) ->
        prefixedEvent = @_createPrefixedEvent event
        @scope?.$emit prefixedEvent, parameters...

    _createPrefixedEvent: (event) ->
        AbstractLeafletBehaviour.createPrefixedEvent event


class BasicBehaviour extends AbstractLeafletBehaviour

    @BOUNDS_CHANGED: 'map-bounds-changed'

    @_LISTED_EVENTS = 'dragend zoomend'

    _doAttach: ->
        @map.on BasicBehaviour._LISTED_EVENTS, @_onBoundsChange
        @_onBoundsChange()

    _doDetach: ->
        @map.off BasicBehaviour._LISTED_EVENTS, @_onBoundsChange

    _onBoundsChange: =>
        @_emit BasicBehaviour.BOUNDS_CHANGED, @map.getBounds()


infra_map.namespace (exports) ->
   exports.AbstractLeafletBehaviour = AbstractLeafletBehaviour
   exports.BasicBehaviour = BasicBehaviour
