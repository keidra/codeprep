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
//= require jquery 
//= require materialize-sprockets 

 $( document ).ready(function(){
   $(".button-collapse").sideNav();


     $('#easy').click(function() {
    window.location.href = 'questions/easy';
    return false;
 });

    $('#medium').click(function() {
    window.location.href = 'questions/medium';
    return false;
 });


       $('#hard').click(function() {
    window.location.href = 'questions/hard';
    return false;
 });

        $('#login').click(function() {
    window.location.href = '/login';
    return false;
 });

    $('.delete').click(function(e){
        // url: 'solutions/:id'
        // var elem = $(this).parent();
        var elem = $(this); 
        var id = elem.attr('id');
        console.log(id);
        var url = '/solutions/' + id ;
        $.ajax({
            url: url,
            method: 'DELETE'
            // ,
            // success: function(){
            //     parent.remove();
        }).always(function(){
            location.reload()
        })
    })

    $('#up').click(function () {
  $(this).toggleClass('on');
    });

     $('#down').click(function () {
  $(this).toggleClass('on');
    });


$(function() {
  setTimeout(function(){
    $('.alert').slideUp(500);
  }, 1000);
});


 });


