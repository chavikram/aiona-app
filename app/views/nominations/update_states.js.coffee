  $("#nomination_state_id").empty().append("<%= j options_from_collection_for_select(@states, :id, :name) 
 %>")
  
