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
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

$(document).ready(function(){
  $('.item-quantity').on('change', function(){
    console.log(this.value);
    console.log($(this).parent().siblings(".item-price").html());
    var numItem = this.value;
    var price = parseFloat($(this).parent().siblings(".item-price").html());
    console.log(price * numItem);
    $(this).parent().siblings(".total-item-price").text(price * numItem);
    var sum = 0;
    $('td.total-item-price').map(function(){
      sum += parseFloat($(this).html());
    });
    $('#total-items-price').text(sum);
  });
});