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
        resource "http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.css"
        resource "http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.ie.css", wrapper: { s -> "<!--[if lt IE 8]>$s<![endif]-->" }
        resource "http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js"
    }
}
