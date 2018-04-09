// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	$('.datepicker').datepicker({
		    format: "dd/mm/yyyy"
	});

	$('#datetimepicker_online_filing_start_date').datetimepicker({
          format: "DD/MM/YYYY hh:mm A"    
	});
	
	$('#datetimepicker_online_filing_end_date').datetimepicker({
          format: "DD/MM/YYYY hh:mm A"    
	});
	
	$('#datetimepicker_offline_filing_start_date').datetimepicker({
          format: "DD/MM/YYYY hh:mm A"    
	});
	
	$('#datetimepicker_offline_filing_end_date').datetimepicker({
          format: "DD/MM/YYYY hh:mm A"    
	});

	$('#datetimepicker_result_datetime').datetimepicker({
          format: "DD/MM/YYYY hh:mm A"    
	});

	$('#datetimepicker_form_issue_date').datetimepicker({
          format: "DD/MM/YYYY hh:mm A"    
	});

//	alert('election.js executed');
});
