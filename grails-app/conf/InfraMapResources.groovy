modules = {
    'infra-map' {
        resource url: [dir: "coffee", file: "factory.coffee", plugin: "infra-map"]
        resource url: [dir: "coffee", file: "behaviours.coffee", plugin: "infra-map"]
        resource url: [dir: "coffee", file: "container.coffee", plugin: "infra-map"]
        resource url: [dir: "coffee", file: "directives.coffee", plugin: "infra-map"]
        dependsOn 'angular', 'leaflet', 'infra-map-utils'
   }

    'infra-map-utils' {
        resource url: [dir: "coffee", file: "utils.coffee", plugin: "infra-map"]
    }

    leaflet {
        resource "http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.css"
        resource "http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.ie.css"
        resource "http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js"
    }
}
