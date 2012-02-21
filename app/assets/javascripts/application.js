// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require underscore-min.js
//= require_tree .

$(function(){

    // Hide section two until section one is completely filled out
    $("#section_2").hide();
  
    // Onchange check to see if all values have been filled out. If so, then
    // show the next div.
    $('.section_1').change(function(){ 

      var should_display_div = new Array();

      $('#section_1').find('.section_1').each(function(){
        if ( $(this).val() == 0 )
          {
            should_display_div.push( $(this) );
          };
      });

      if ( should_display_div.length == 0 )
        { 
          $("#section_2").show();
        };
    });
});
