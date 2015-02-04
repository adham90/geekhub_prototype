(function(window, google, mapster) {

  // map options
  mapster.profile_map = {
    center: {
      lat: 37.791350,
      lng: -122.435883
    },
    styles: [{"featureType":"water","stylers":[{"visibility":"on"},{"color":"#b5cbe4"}]},{"featureType":"landscape","stylers":[{"color":"#efefef"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#83a5b0"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#bdcdd3"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e3eed3"}]},{"featureType":"administrative","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"road"},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{},{"featureType":"road","stylers":[{"lightness":20}]}],
    zoom: 14,
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
    styles: [{"featureType":"water","stylers":[{"visibility":"on"},{"color":"#b5cbe4"}]},{"featureType":"landscape","stylers":[{"color":"#efefef"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#83a5b0"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#bdcdd3"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e3eed3"}]},{"featureType":"administrative","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"road"},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{},{"featureType":"road","stylers":[{"lightness":20}]}],
    scrollwheel: false,
    zoom: 5
  }

}(window, google, window.Mapster || (window.Mapster = {})));





// var mapOptions = {
//   zoom: 16,
//   center: new google.maps.LatLng(parseFloat(gon.lat), parseFloat(gon.log)),
// };

// var mapElement = document.getElementById('profile-map');

// var map = new google.maps.Map(mapElement, mapOptions);

// var marker = new google.maps.Marker({
//   position: new google.maps.LatLng(parseFloat(gon.lat), parseFloat(gon.log)),
//   map: map,
//   icon: "/images/geek_marker.png",
//   title: gon.profile_name
// });

// var infowindow = new google.maps.InfoWindow({
//     content: "name"
// });

// google.maps.event.addListener(marker, 'click', function() {
//   infowindow.open(map,marker);
// });
