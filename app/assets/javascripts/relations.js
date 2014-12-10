$( document ).ready(function() {
    $("#askSuggestions").click(function (){
    	jour_num    = $("#relation_link_attributes_journal").val()
    	cand_id     = $("#relation_candidate_id").val()
    	rel_type_id = $("#relation_relation_type_id").val()
    	al_id       = $("#relation_ally_id").val()
    	hash = { journal_number: jour_num, candidate_id: cand_id,relation_type_id: rel_type_id, ally_id: al_id }

      // $("#myModal").modal();

   		$.post( "/link_suggestions", hash ).done(function(data){

   			if(data.indexOf("ERROR:") == 0 )
          alert(data);

   			console.log(data);

        obj = JSON.parse(data);

        var table = document.getElementById("toAdd");

        for( i=0; i <obj.length; i++ )
        {
          var row =  table.insertRow(i); 
          
          var cell1 = row.insertCell(0);
          var cell2 = row.insertCell(1);
          var cell3 = row.insertCell(2);
          var cell4 = row.insertCell(2);
          var cell5 = row.insertCell(4);

          var notice = obj[i];

          // cell1.innerHTML = notice.link;

          cell1.innerHTML = notice.article_title;
          createALinkIn(cell2,notice.link);
          cell3.innerHTML = notice.search_text;
          createAButtonIn(cell4);
          cell5.innerHTML = notice.article_text;
          cell5.style.display = "none";

          cell1.className = "art_title";
          cell2.className = "art_link";
          cell3.className = "art_searchtxt";
          cell4.className = "art_button";
          cell5.className = "art_text";

        }

   			
   		}); 	
    });
});

var acceptNotice = function(caller)
{

  alert("holi mensi");
  alert(caller);
  tr = $(caller).parents("tr");

  art_text   = tr.children("td.art_text").html();
  art_link   = tr.children("td.art_link").children("a").attr("href");
  art_srctxt = tr.children("td.art_searchtxt").html();
  art_title   = tr.children("td.art_title").html();
  console.log("1" + art_text);
  console.log("2" + art_link);
  console.log("3" + art_srctxt);
  console.log("4" + art_title);
  console.log("5"  );

  $("#relation_link_attributes_content").html(art_text);
  $("#relation_link_attributes_url"    ).val(art_link);
  $("#relation_link_attributes_title"  ).val(art_title);
}

function createAButtonIn(cell)
{
  var btn = document.createElement("BUTTON");        // Create a <button> element
  var t = document.createTextNode("Correcto");       // Create a text node
  btn.appendChild(t);
  btn.className = "btn";
  btn.onclick = acceptNotice;
  cell.appendChild(btn);
}
function createALinkIn(cell,href)
{
  var link = document.createElement("a");        // Create a <button> element
  var t = document.createTextNode("link");       // Create a text node
  link.href = href;
  link.target="_blank";
  link.appendChild(t);
  cell.appendChild(link);
}