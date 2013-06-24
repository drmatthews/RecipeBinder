jQuery ->
  $("<div id=\"recipe_dialog\" ></div>").hide().appendTo $("body")
    
  $("#recipe_dialog").dialog
    autoOpen: false
    width: Math.floor($('body').width() * .30)
    height: Math.floor($('body').height() * 1) 
    modal: true
  
  #closeOnEscape: false,
  $(".open-dialog").click ->
    $("#recipe_dialog").dialog "open"
    false