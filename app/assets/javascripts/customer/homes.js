// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener("turbolinks:load"
, function () {
  $(function() {
  // 一旦hide()で隠してフェードインさせる
    $('h4').hide().fadeIn(3000);

  });
})