$( document ).ready(function() {
    $("#askSuggestions").click(function (){
    	jour_num    = $("#relation_link_attributes_journal").val()
    	cand_id     = $("#relation_candidate_id").val()
    	rel_type_id = $("#relation_relation_type_id").val()
    	al_id       = $("#relation_ally_id").val()
    	hash = { journal_number: jour_num, candidate_id: cand_id,relation_type_id: rel_type_id, ally_id: al_id }
   		$.post( "/link_suggestions", hash ).done(function(data){
   			alert(data);
   			console.log(data);
   			data = data.replace();
   			$("#toAdd").text(data);
   		}); 	
    });
});