$(document).on('turbolinks:load', function(){

    $(window).scroll(function(){
        var sticky = $('.main_header'),
            scroll = $(window).scrollTop();

        if (scroll >= 500) sticky.addClass('fixed');
        else sticky.removeClass('fixed');
    });

/*$(document).scroll(function(e){
    var scrollTop = $(document).scrollTop();
    if(scrollTop > 0){
        console.log(scrollTop);
        $('.navbar').addClass('navbar-fixed-top stylefor-navbar-fixed-top');
    } else {
        $('.navbar').removeClass('navbar-fixed-top stylefor-navbar-fixed-top');
    }
});
    $(document).scroll(function(e){
        var scrollTop = $(document).scrollTop();
        if(scrollTop > 0){
            console.log(scrollTop);
            $('.dbheader_wrap').addClass('navbar-fixed-top');
        } else {
            $('.dbheader_wrap').removeClass('navbar-fixed-top');
        }
    });

    $('#show_left_menu').click(function(){
        $('.static_menu').slideToggle(300);
    });
    */


});
















/*
$(document).on('turbolinks:load', function(){

    */
/**
     * This object controls the nav bar. Implement the add and remove
     * action over the elements of the nav bar that we want to change.
     *
     * @type {{flagAdd: boolean, elements: string[], add: Function, remove: Function}}
     *//*

    var myNavBar = {

        flagAdd: true,

        elements: [],

        init: function (elements) {
            this.elements = elements;
        },

        add : function() {
            if(this.flagAdd) {
                for(var i=0; i < this.elements.length; i++) {
                    document.getElementById(this.elements[i]).className += " fixed-theme";
                }
                this.flagAdd = false;
            }
        },

        remove: function() {
            for(var i=0; i < this.elements.length; i++) {
                document.getElementById(this.elements[i]).className =
                    document.getElementById(this.elements[i]).className.replace( /(?:^|\s)fixed-theme(?!\S)/g , '' );
            }
            this.flagAdd = true;
        }

    };

    */
/**
     * Init the object. Pass the object the array of elements
     * that we want to change when the scroll goes down
     *//*

    myNavBar.init(  [
        "header",
        "header-container",
        "brand"
    ]);

    */
/**
     * Function that manage the direction
     * of the scroll
     *//*

    function offSetManager(){

        var yOffset = 0;
        var currYOffSet = window.pageYOffset;

        if(yOffset < currYOffSet) {
            myNavBar.add();
        }
        else if(currYOffSet == yOffset){
            myNavBar.remove();
        }

    }

    */
/**
     * bind to the document scroll detection
     *//*

    window.onscroll = function(e) {
        offSetManager();
    }

    */
/**
     * We have to do a first detectation of offset because the page
     * could be load with scroll down set.
     *//*

    offSetManager();
});*/
