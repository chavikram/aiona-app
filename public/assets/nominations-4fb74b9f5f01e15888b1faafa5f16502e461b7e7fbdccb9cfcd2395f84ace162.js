// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){
	$('.datepicker').datepicker({
		    format: "dd/mm/yyyy"
	});

//	alert('election.js executed');
});
(function() {
  $(function() {
    return $(document).on('change', '#state_id', function(evt) {

      return $.ajax('update_posts', {
        type: 'GET',
        dataType: 'script',
        data: {
          election_id: $("#election_id option:selected").val(),
          state_id: $("#state_id option:selected").val()
        },
        error: function(jqXHR, textStatus, errorThrown) {
          return console.log("AJAX Error: " + textStatus);
        },
        success: function(data, textStatus, jqXHR) {
          return console.log("Dynamic election posts select OK!");
        }
      });
    });
  });

}).call(this);
