// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	$('.datepicker').datepicker({
		    format: "dd/mm/yyyy"
	});

	$('#datetimepicker_election_start_time').datetimepicker({
          format: "DD/MM/YYYY hh:mm A"    
	});

	$('#datetimepicker_election_end_time').datetimepicker({
          format: "DD/MM/YYYY hh:mm A"    
	});

//	alert('election.js executed');
});
