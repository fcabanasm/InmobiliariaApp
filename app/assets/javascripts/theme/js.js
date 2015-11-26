$(function() {
		"use strict";
		new WOW().init();
		$( "#departure_date" ).datepicker({ minDate: -0, maxDate: "+3M" });
		$( "#return_date" ).datepicker({ minDate: -0, maxDate: "+3M" });
		$( "#check_out" ).datepicker({ minDate: -0, maxDate: "+3M" });
		$( "#check_in" ).datepicker({ minDate: -0, maxDate: "+3M" });
		$( "#package_start" ).datepicker({ minDate: -0, maxDate: "+3M" });
		$( "#car_start" ).datepicker({ minDate: -0, maxDate: "+3M" });
		$( "#car_end" ).datepicker({ minDate: -0, maxDate: "+3M" });
		$( "#cruise_start" ).datepicker({ minDate: -0, maxDate: "+3M" });
		$( "#adult_count" ).spinner({
			min: 1
		});
		$( "#child_count" ).spinner( {
			min: 1
		});
		$( "#hotel_adult_count" ).spinner( {
			min: 1
		});
		$( "#hotel_child_count" ).spinner( {
			min: 1
		});
		$('.selectpicker').selectpicker({
			style: 'custom-select-button'
		});
});