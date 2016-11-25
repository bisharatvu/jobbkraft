$(document).ready(function(){
    Authentication.callbackSubmit();
});

var Authentication = {
    callbackSubmit: function(){
        var self = this;

        $("form#login_box").bind("ajax:success", function(e, response, status, xhr){
            if(response.success){
                window.location.reload();
                toastr.success('Signed in successfully.').options.positionClass = 'toast-top-center';
            }else{
                self.errorsFromServer();
            }
        });
    },
    errorsFromServer: function(){
        // Show error to UI
        //alert('Failed ...');

        toastr.error('Email or Password Invalid!');

    }
};


$(document).ready(function(){
    AuthenticateSignUp.callbackSubmit();
});

var AuthenticateSignUp = {
    callbackSubmit: function(){
        var self = this;

        $("form#sign_up_box").bind("ajax:success", function(e, response, status, xhr){
            if(response.success){
                window.location.reload();
                toastr.success('Signed Up successfully.').options.positionClass = 'toast-top-center';
            }else{
                self.errorsFromServer();
            }
        });
    },
    errorsFromServer: function(){
        // Show error to UI
        //alert('Failed ...');

        toastr.error('The email address has already been taken.');

    }
};