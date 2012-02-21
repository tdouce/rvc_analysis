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

    function show_or_hide_section(){

      var should_display_div = new Array();

      $('#section_1').find('.section_1').each(function(){
        // This equality test does NOT work with '0' because they time
        // option_selects can be '0'
        if ( $(this).val() == '' )
          {
            should_display_div.push( $(this) );
          };
      });

      if ( should_display_div.length == 0 )
        { 
          $("#section_2").show();
        };
    };

    // Check to see if section should be shown or hidden
    show_or_hide_section();

    // Onchange check to see if all values have been filled out. If so, then
    // show the next div.
    $('.section_1').change(function(){ 
        show_or_hide_section();
    });
});
