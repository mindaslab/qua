# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#answer_content').keyup ->
    len = $('#answer_content').val().length
    $('#char_count').html(""+(5000-len))