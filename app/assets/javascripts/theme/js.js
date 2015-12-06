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

$(document).ready(function(){
	$('#apartment_address').change(function(){
    var dir = $("#apartment_address").val();
    $('#map_info').remove();
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({address: dir}, function(results, status) {
    handler = Gmaps.build('Google');
    handler.buildMap({
    provider: {
      disableDefaultUI: true
      // pass in other Google Maps API options here
    },
    internal: {
      id: 'map'
    }
  },
  function(){
    markers = handler.addMarkers([
      {
        "lat": results[0].geometry.location.G,
        "lng": results[0].geometry.location.K
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(16);
  }
);
});

});
    var current_img=1;
    $("#add_img").click(function(){
      if(current_img<3){
        var imgtag='<input name="images[]" id="images_" type="file">';
        $(".img_place").prepend(imgtag);
        current_img++; 
      }
    });

  $('#pictureInput').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
      img.src = file.target.result;
      $('#target').html(img);
    }
    reader.readAsDataURL(image);
    console.log(files);
  });

  });