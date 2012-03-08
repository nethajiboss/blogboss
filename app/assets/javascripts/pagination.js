$(function() { $(".pagination a").live("click",function() {  
$.get(this.href,null,null,"script"); 
return false;  
}); 
});

$(function() {
  $("#entries_search input").keyup(function() {
    $.get($("#entries_search").attr("action"), $("#entries_search").serialize(), null, "script");
    return false;
  });
});	
