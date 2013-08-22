modules = {
    'infra-map' {
        resource url: [dir: "coffee", file: "utils.coffee", plugin: "infra-map"], bundle: "infra-map"
        resource url: [dir: "coffee", file: "LeafletMapFactory.coffee", plugin: "infra-map"], bundle: "infra-map"
        resource url: [dir: "coffee", file: "behaviours.coffee", plugin: "infra-map"], bundle: "infra-map"
        resource url: [dir: "coffee", file: "MapContainer.coffee", plugin: "infra-map"], bundle: "infra-map"
        resource url: [dir: "coffee", file: "directives.coffee", plugin: "infra-map"], bundle: "infra-map"
        dependsOn 'angular', 'leaflet'
   }

    leaflet {
        resource id: "leaflet.css", url: "http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.css"
        resource id: "leaflet.ie.css", url: "http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.ie.css", wrapper: { s -> "<!--[if lt IE 8]>$s<![endif]-->" }
        resource id: "leaflet.js", url: "http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.js"
    }
}
