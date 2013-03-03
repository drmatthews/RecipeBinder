RB = {
    setup: function() {       
        $('<div id="recipeInfo" title="Recipe Info"></div>').
            hide().
            appendTo($('body'));   
        $('#recipes a').button().click(RB.getRecipeInfo);
        $('<div id="editrecipeInfo"></div>').
            hide().
            appendTo($('body'));
    },
    getRecipeInfo: function() {
        $.ajax({type: 'GET',
                url: $(this).attr('href'),
                timeout: 5000,
                success: RB.showRecipeInfo,
                error: function() { alert('Error!'); }
               });
        return(false);
    },   
    showRecipeInfo: function(data) {
       var oneFourth = Math.ceil($(window).width() / 4);
       $('#recipeInfo').html(data).dialog({
       		autoOpen: false,
       		show: 'blind',
       		hide: 'blind',
			'left': oneFourth,  
			'width': 2*oneFourth,
			'top': 250,
			modal: true
			}).dialog('open');
	   $('#editLink').button().click(RB.putRecipeInfo);
        return(false);  // prevent default link action
    },
    putRecipeInfo: function() {
        $.ajax({type: 'GET',
                url: $('#editLink').attr('href'),
                timeout: 5000,
                success: RB.editRecipeInfo,
                error: function() { alert('Error!'); }
               });
        return(false);
    },
    editRecipeInfo: function(data) {
        // center a floater 1/2 as wide and 1/4 as tall as screen
        var oneFourth = Math.ceil($(window).width() / 4);
        $('#recipeInfo').dialog('close');
        $('#editrecipeInfo').html(data).dialog({
       		autoOpen: false,
       		show: 'blind',
       		hide: 'blind',
			'left': oneFourth,  
			'width': 2*oneFourth,
			'top': 250,
			modal: true
			}).dialog('open');
		$('#addIngredient').button();
		$('#addStep').button();	
        $('#updateRecipe').button();
        $('#updateRecipe').submit(function() {
          alert('Handler for .submit() called.');
          return false;
         });
        return(false); // prevent default link action
    }, 
    hideRecipeInfo: function() {
        $('#recipeInfo').hide(); 
        return(false);
    }
}
$(RB.setup);       // when document ready, run setup code