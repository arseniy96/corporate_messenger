// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cable
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

function avatar() {
  var div1 = $('#header1');
  var h1 = $(div1).height();
  var w1 = $(div1).width();
  div1 = $('#avatar');
  var h2 = $(div1).height() / 2;
  var w2 = $(div1).width() / 2;
  $(div1).css('top', (h1-h2+20-3) + 'px').css('left', (w1-w2+30-3) + 'px'); //3px = border
}