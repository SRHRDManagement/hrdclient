jQuery(document).ready(function() {
                
	// Date Picker
	jQuery('#dpStartDate').datepicker({
		autoclose: true,
		todayHighlight: true,
		format: 'yyyy-mm-dd'
	});
	
	jQuery('#dpEndDate').datepicker({
		autoclose: true,
		todayHighlight: true,
		format: 'yyyy-mm-dd'
	});
	
	jQuery('#dpStartDateUpdate').datepicker({
		autoclose: true,
		todayHighlight: true,
		format: 'yyyy-mm-dd'
	});
	
	jQuery('#dpEndDateUpdate').datepicker({
		autoclose: true,
		todayHighlight: true,
		format: 'yyyy-mm-dd'
	});
	
	/*$("#plusButton").click(function(){
		$("#generation-layout").slideToggle();
		if($("#plusButton").val()=='plus') {
			$("#plusButton").val('minus');
			$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-minus-sign"></i>');
		}else{
			$("#plusButton").val('plus');
			$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-plus-sign"></i>');
		}
	 });*/
                
});