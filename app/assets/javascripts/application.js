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
//= require bootstrap-sprockets
//= require rails.validations
//= require rails.validations.simple_form
//= require turbolinks
//= require gmaps-auto-complete
//= require leaflet-google
//= require_tree .

$(function() {
  var googleLayer, map, marker;
  map = L.map("profile-map").setView([parseFloat(gon.lat), parseFloat(gon.log)], 13);
  googleLayer = new L.Google("ROADMAP");
  map.addLayer(googleLayer);
  return marker = L.marker([parseFloat(gon.lat), parseFloat(gon.log)]).addTo(map);
});

