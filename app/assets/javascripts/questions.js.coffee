# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#question_content').keyup ->
    len = $('#question_content').val().length
    $('#char_count').html(""+(5000-len))
  
  $('#question_tag_string').keyup ->
    number_of_tags = $('#question_tag_string').val().split(',').length
    $('#tag_error').show() if number_of_tags > 10
    $('#tag_error').hide() if number_of_tags <= 10 
