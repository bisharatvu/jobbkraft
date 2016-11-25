# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
###$(document).ready ->
  $("form#login-box").bind "ajax:success", (e, data, status, xhr) ->
  #$(document).on "ajax:success", "form#login-box", (e, data, status, xhr) ->
    if data.success
      #javascript that executes if everything goes o.k.
      $('#sign_in').modal('hide')
      $('#sign_in_button').hide()
      $('#submit_comment').slideToggle(1000, "easeOutBack" )
    else
      alert('failure!')###

###
$(document).ready ->
  $("#login-box").on("ajax:success", (e, data, status, xhr) ->
    $("#new_article").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $alert('failure!')###

