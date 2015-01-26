// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.turbolinks
//= require autocomplete-rails
//= require jquery-geocomplete
//= reuqire gmaps
//= require bootstrap-sprockets
//= require rails.validations
//= require rails.validations.simple_form
//= require_tree .


// $(function() {
//   var mapOptions = {
//     zoom: 16,
//     center: new google.maps.LatLng(parseFloat(gon.lat), parseFloat(gon.log)),
//     styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}]
//   };
//   var mapElement = document.getElementById('profile-map');
//   var map = new google.maps.Map(mapElement, mapOptions);
//   var marker = new google.maps.Marker({
//     position: new google.maps.LatLng(parseFloat(gon.lat), parseFloat(gon.log)),
//     map: map,
//     title: 'Snazzy!'
//   });
// });