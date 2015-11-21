# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).bind 'ajaxSuccess', 'form', (event, xhr, settings) ->
  if xhr.responseJSON.entity == 'contact'
    $('.form-unsent').css('display', 'none')
    $('.form-sent').css('display', 'block')

$(document).bind 'ajaxError', 'form', (event, xhr, settings, exception) ->
  if xhr.responseJSON.entity == 'contact'
    errors = xhr.responseJSON.errors
    $('#new_contact input').removeClass('error')
    if errors.from
      $('#new_contact [name="contact[from]"]').addClass('error')
    if errors.email
      $('#new_contact [name="contact[email]"]').addClass('error')
    if errors.message
      $('#new_contact [name="contact[message]"]').addClass('error')
