
  $("#nomination_election_post_id").empty().append("<%= j options_from_collection_for_select(@election_posts, :id, :post_name) 
 %>")
 
