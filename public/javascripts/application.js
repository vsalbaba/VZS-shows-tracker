// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	var dates = $( "input.ui-daterange-picker#from_date, input.ui-daterange-picker#to_date" ).datepicker({
    dateFormat: 'dd. mm. yy',
		onSelect: function( selectedDate ) {
			var option = this.id == "from_date" ? "minDate" : "maxDate",
				instance = $( this ).data( "datepicker" ),
				date = $.datepicker.parseDate(
					instance.settings.dateFormat,
					selectedDate,
          instance.settings
        );
		  dates.not( this ).datepicker( "option", option, date );
	  }
  });
});
