import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  // map.addMarkers(markers);
  // if (markers.length === 0) {
  //   map.setZoom(2);
  // } else if (markers.length === 1) {
  //   map.setCenter(markers[0].lat, markers[0].lng);
  //   map.setZoom(14);
  // } else {
  //   map.fitLatLngBounds(markers);
  // }
  // Here we store map markers in an array BEFORE adding them to the map
  const mapMarkers = [];
  markers.forEach((marker) => {
    const mapMarker = map.createMarker(marker);
    mapMarkers.push(mapMarker);
    map.addMarker(mapMarker);
  });

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }

  // Map marker animation
  // Select all cards
  const cards = document.querySelectorAll('.wrapper');
  cards.forEach((card, index) => {
    // Put a microphone on each card listenning for a hover event
    card.addEventListener('mouseenter', () => {
      // Here we trigger the display of the corresponding marker infoWindow as it is the default behavior of a click on a  marker
      google.maps.event.trigger(mapMarkers[index], 'click');
    });
  });
  const styles = [ {
        "stylers": [
            {
                "saturation": -100
            },
            {
                "gamma": 1
            }
        ]
    },
    {
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.business",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.business",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.place_of_worship",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.place_of_worship",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "water",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "saturation": 50
            },
            {
                "gamma": 0
            },
            {
                "hue": "#50a5d1"
            }
        ]
    },
    {
        "featureType": "administrative.neighborhood",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#333333"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "labels.text",
        "stylers": [
            {
                "weight": 0.5
            },
            {
                "color": "#333333"
            }
        ]
    },
    {
        "featureType": "transit.station",
        "elementType": "labels.icon",
        "stylers": [
            {
                "gamma": 1
            },
            {
                "saturation": 50
            }
        ]
    } ];

  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');
  map.setCenter(lat, lng);
}

autocomplete();
