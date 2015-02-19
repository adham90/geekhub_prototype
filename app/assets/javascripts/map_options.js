(function(window, google, mapster) {

  var style = [{"featureType":"water","stylers":[{"visibility":"on"},{"color":"#b5cbe4"}]},{"featureType":"landscape","stylers":[{"color":"#efefef"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#83a5b0"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#bdcdd3"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e3eed3"}]},{"featureType":"administrative","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"road"},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{},{"featureType":"road","stylers":[{"lightness":20}]}];


  // map options
  mapster.profile_map = {
    center: {
      lat: 37.791350,
      lng: -122.435883
    },
    styles: style,
    zoom: 9,
    mapTypeControl: false,
    ControlPosition: true,
    scrollwheel: false,
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.SMALL,
      position: google.maps.ControlPosition.RIGHT_TOP
    },
    draggable: true
  }

  mapster.search_map = {
    center: {
      lat: 37.791350,
      lng: -122.435883
    },
    styles: style,
    scrollwheel: true,
    zoom: 5
  }

  mapster.address_map = {
    center: {
      lat: 37.791350,
      lng: -122.435883
    },
    styles: style,
    draggable: true,
    scrollwheel: true,
    zoom: 16
  }
}(window, google, window.Mapster || (window.Mapster = {})));
