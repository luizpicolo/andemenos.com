// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.infinite-pages
//= require alert_message
//= require owl.carousel
//= require turbolinks
//= require jquery.raty
//= require letsrate

$(document).ready(function() {
  $('.nav-menu').click(function(event) {
    $('.bg-overlay').css('display', 'block');
    $('.nav-categories').css('left', '0');
  });

  $('.nav-close').click(function(event) {
    $('.nav-categories').css('left', '-270px');
    $('.bg-overlay').css('display', 'none');
  });
});

$(function() {
  return $('.list-products').infinitePages({
    loading: function() {
      return $(this).html('<i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    error: function() {
      return $(this).text('Aconteceu um erro. Atualize página');
    }
  });
});

time = 400;

// owl carousel
$(function(){
  var owl = $('.owl');

  if(owl.length){
    owl.owlCarousel({
      singleItem: true,
      autoPlay: true,
      stopOnHover: true,
      navigation: false,
      rewindSpeed: 1000,
      autoPlay: 6000,
      slideSpeed: 300,
      pagination: false
    });
  }
})
