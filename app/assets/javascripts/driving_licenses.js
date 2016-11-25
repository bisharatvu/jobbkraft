/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/*/



$(document).on('turbolinks:load', function(){

    /*############ Submit Form Check Box Am ###########*/
    $('#Am input').change(function(){
        $(this).closest('form').ajaxSubmit({
            beforeSubmit: function(a,f,o) {
                o.dataType = 'json';
            },
            complete: function(XMLHttpRequest, textStatus) {

                // do something after success or failer
            }
        });
    });

});


$(document).on('turbolinks:load', function(){

    /*############ Submit Form Check Box Am ###########*/
    $('#edit_company input').change(function(){
        $(this).closest('form').ajaxSubmit({
            beforeSubmit: function(a,f,o) {
                o.dataType = 'json';
            },
            complete: function(XMLHttpRequest, textStatus) {
                window.location.reload();
                // do something after success or failer
            }
        });
    });

});

