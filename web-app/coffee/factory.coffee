class LeafletMapFactory

    _initialCenter: [59.943, 30.305]
    _initialZoom: 13

    createMap: (element) ->
        mapOptions =
            center: @_initialCenter
            zoom: @_initialZoom
            layers: [@_initializeMapTileLayer()]

        map = new L.Map element, mapOptions

    _initializeMapTileLayer: ->
        tileTemplateUrl = 'http://{s}.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.png'

        tileLayerOptions =
            subdomains: ['otile1', 'otile2', 'otile3', 'otile4']
            attribution: @_createAttributionString()

        new L.tileLayer(tileTemplateUrl, tileLayerOptions)

    _createAttributionString: ->
        OSMLink = '<a href=http://www.openstreetmap.org>OpenStreetMap</a>'
        OSMAttribution  = "Map data © #{OSMLink} contributors"

        ODLAttribution = '<a href=http://opendatacommons.org/licenses/odbl/>ODbL</a>'

        MapQuestLink = '<a href="http://www.mapquest.com/" target="_blank">MapQuest</a>'
        MapQuestLogo = '<img src="http://developer.mapquest.com/content/osm/mq_logo.png">'
        MapQuestAttribution = "Tiles Courtesy of #{MapQuestLink} #{MapQuestLogo}"

        "#{OSMAttribution}, #{ODLAttribution}, #{MapQuestAttribution}"


infra_map.namespace (exports) ->
    exports.LeafletMapFactory = LeafletMapFactory
