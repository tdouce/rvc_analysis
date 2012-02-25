// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require underscore-min.js
//= require jquery_nested_form
//= require_tree .

$(function(){
    
    // Hide section two until section one is completely filled out
    //$("#section_2").hide();

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

    
    function calculate_surface_relief( input_class_to_sum, id_to_display_total){

      var sum_for_display_total = new Array();

      $('#section_2').find('.' + input_class_to_sum).each(function(){
        if ( $(this).val() != 0 )
          {
            sum_for_display_total.push( $(this).val() );
          };
      });

      var total = 0;

      $.each(sum_for_display_total,function() {
          total += parseFloat( this );
      });

      // If total is greater than 100 then flag it by add a red background.
      if ( total != 100 )
        { 
          $( '#' + id_to_display_total).removeClass('one_hundred_ok_flag');
          $( '#' + id_to_display_total).addClass('one_hundred_flag');
        }
      else
        {
          $( '#' + id_to_display_total).addClass('one_hundred_ok_flag');
          $( '#' + id_to_display_total).removeClass('one_hundred_flag');
        }

      $( '#' + id_to_display_total).val( total );

    };

    
    // When species select options change then loop through each value and
    // append that value to to the div that displays all the species that have
    // been added up to this point, and hide all the select_options.  When user 
    // double clicks on species in div then show the animals associated
    // select_options
    function display_selected_species_in_div(){

      // Onchange remove all species in div and than add them again
      $('.section_3').live("change", function(){ 

        $('#selected_species').find('.added_species').each(function(){
            $(this).remove();
        });
        
        //Hide that species select options 
        $('#section_3 .specie').each(function(){

            $(this).closest('.add_species').hide();

            var klass = 'added_species ' + $(this).attr('id')
            $( '<li class="' + klass + '">' + $("option:selected", this ).text() + '</li>' ).appendTo('#selected_species');
        });

      });

      // When user double clicks on species in div, then show the animals
      // associated select_options
      $('.added_species').live("dblclick", function(){ 
          var eye_d = $(this).attr('class').split(/\s/)[1]
          $('#' + eye_d ).closest('.add_species').show();
      });


      // Fix the remove species link_to
      //$('.remove_species').live("click", function(){ 
      //  $('#selected_species').find('.added_species').each(function(){
      //      $(this).remove();
      //  });
      //});
    };


    display_selected_species_in_div();

    // Check to see if section should be shown or hidden when page loads
    show_or_hide_section();

    // Onchange check to see if all values have been filled out. If so, then show the next div.
    $('.section_1').change(function(){ 
        show_or_hide_section();
    });

    // Calculate total for 'surface_hard' when page loads
    calculate_surface_relief( 'surface_relief_hard', 'surface_relief_hard_total' );

    // Calculate total for 'surface_hard' on change 
    $('.surface_relief_hard').change(function(){ 
        calculate_surface_relief( 'surface_relief_hard', 'surface_relief_hard_total' );
    });

    // Calculate total for 'surface_soft' when page loads
    calculate_surface_relief( 'surface_relief_soft', 'surface_relief_soft_total' );

    // Calculate total for 'surface_soft' on change 
    $('.surface_relief_soft').change(function(){ 
        calculate_surface_relief( 'surface_relief_soft', 'surface_relief_soft_total' );
    });

});
