//var host="http://192.168.1.104:8080";
//var host="http://localhost:8080";
$(document).ready(function() {
	
	var options = {
			url: host+"/resources/static/file/allNation.json",

			getValue: "nationality",

			list: {
				match: {
					enabled: true
				}
			}
		};
	
	$("#uNationality").easyAutocomplete(options);
	
	jQuery('#uDob').datepicker({
		autoclose: true,
		todayHighlight: true,
		format: 'yyyy-mm-dd'
	});
                
});
function initialize() {
    var input = document.getElementById('uAddress');
    var autocomplete = new google.maps.places.Autocomplete(input);
 }
 google.maps.event.addDomListener(window, 'load', initialize);