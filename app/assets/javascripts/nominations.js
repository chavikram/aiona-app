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
    return $(document).on('click', '#election_id', function(evt) {

      return $.ajax('../nominations/update_states', {
        type: 'GET',
        dataType: 'script',
        data: {
          election_id: $("#election_id option:selected").val()
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

(function() {
  $(function() {
    return $(document).on('click', '#nomination_state_id', function(evt) {

      return $.ajax('../nominations/update_posts', {
        type: 'GET',
        dataType: 'script',
        data: {
          election_id: $("#election_id option:selected").val(),
          state_id: $("#nomination_state_id option:selected").val()
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


