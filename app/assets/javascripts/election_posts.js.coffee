  
$ ->
  $(document).on 'change', '#state_id', (evt) ->
    $.ajax 'update_posts',
      type: 'GET'
      dataType: 'script'
      data: {
        election_id: $("#election_id option:selected").val(),
        state_id: $("#state_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic election posts select OK!")

