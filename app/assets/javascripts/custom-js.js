

//datepicker start

$(document).on('turbolinks:load', function(){
    $('[data-behaviour~=datepicker]').datepicker({format: 'yyyy-mm-dd'});


});

//datepicker end

$(document).on('turbolinks:load', function(){
    $('#video_upload_form input').change(function(){
        showLoading();
        $(this).closest('form').ajaxSubmit({
            beforeSubmit: function(a,f,o) {
                o.dataType = 'json';
            },
            complete: function(XMLHttpRequest, textStatus) {
                window.location.reload();
// XMLHttpRequest.responseText will contain the URL of the uploaded image.
// Put it in an image element you create, or do with it what you will.
// For example, if you have an image elemtn with id "my_image", then
                //$('#my_image').attr('src', XMLHttpRequest.responseText);
// Will set that image tag to display the uploaded image.
            }
        });
    });
    function hideLoading() {
        // other code can be placed here
        $("#loading").hide();
        // other code can be placed here
    }

    function showLoading() {
        // other code can be placed here
        $("#loading").show();
        // other code can be placed here
    }
    function dosomething() {
        showLoading();
        // simulate a task that can take 3 seconds
        // afterwards show hide the loading GIF
        setTimeout("hideLoading()", 3000);
        return false;
    }
});
//Add User Profile Picture Start

$(document).on('turbolinks:load', function(){
$('#upload_form input').change(function(){
    $(this).closest('form').ajaxSubmit({
        beforeSubmit: function(a,f,o) {
            o.dataType = 'json';
        },
        complete: function(XMLHttpRequest, textStatus) {
// XMLHttpRequest.responseText will contain the URL of the uploaded image.
// Put it in an image element you create, or do with it what you will.
// For example, if you have an image elemtn with id "my_image", then
 $('#my_image').attr('src', XMLHttpRequest.responseText);
            window.location.reload();

// Will set that image tag to display the uploaded image.
        }
    });
  });
});
//End
//
// Start

//Start

//End
//End

/*
$('#confirm-delete').on('show.bs.modal', function(e) {
    var data = $(e.relatedTarget).data();
    $('.title', this).text(data.recordTitle);
    $('.btn-ok', this).data('recordId', data.recordId);
});


$('#confirm-delete').on('click', '.btn-ok', function(e) {
    var $modalDiv = $(e.delegateTarget);
    var id = $(this).data('recordId');
    // $.ajax({url: '/api/record/' + id, type: 'DELETE'})
    // $.post('/api/record/' + id).then()
    $modalDiv.addClass('loading');
    */
/*setTimeout(function() {
        $modalDiv.modal('hide').removeClass('loading');
    }, 100000)*//*

});*/


//Select selection start
/*
$('#sel1').change(function(){
    var sel1 = document.querySelector('#sel1');
    var sel2 = document.querySelector('#sel2');
    var options2 = sel2.querySelectorAll('option');
    giveSelection(sel1.value);
});

function giveSelection(selValue) {
    sel2.innerHTML = '';
    for(var i = 0; i < options2.length; i++) {
        if(options2[i].dataset.option === selValue) {
            sel2.appendChild(options2[i]);
        }
    }
}*/
//Select selection end