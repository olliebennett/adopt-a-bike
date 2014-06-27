// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Clickable Tables
$('table.table-clickable > tbody > tr').click(function() {
  // Get link from first <td> element and go there!
  var url = $(this).children(":first").find("a").attr('href');
  //console.log("Row URL: " + url);
  if (typeof url !== "undefined") {
    window.location.href = url;
  }
});