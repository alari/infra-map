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
        AbstractLeafletBehaviour.createPrefixedEvent event, @prefix


class BasicBehaviour extends AbstractLeafletBehaviour

    @BOUNDS_CHANGED: 'map-bounds-changed'

    @MAP_CLICKED = 'map-clicked'

    _doAttach: ->
        @map.on 'dragend zoomend', @_onBoundsChange
        @map.on 'click', @_onMapClick
        @_onBoundsChange()

    _doDetach: ->
        @map.off 'dragend zoomend', @_onBoundsChange
        @map.off 'click', @_onMapClick

    _onBoundsChange: =>
        @_emit BasicBehaviour.BOUNDS_CHANGED, @map.getBounds()

    _onMapClick: (event) =>
        @_emit BasicBehaviour.MAP_CLICKED, event.latlng


infra_map.namespace (exports) ->
   exports.AbstractLeafletBehaviour = AbstractLeafletBehaviour
   exports.BasicBehaviour = BasicBehaviour
