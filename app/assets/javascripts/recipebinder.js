RB = {
    setup: function() {       
        //$('<div id="recipeInfo" title="Recipe Info"></div>').
        $('<div id="recipeInfo" class="modal hide fade"></div>').
            hide().
            appendTo($('body'));   
        $('#recipes #recipeID').button().click(RB.getRecipeInfo);
        $('<div id="editrecipeInfo" class="modal hide fade"></div>').
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
        $('#recipeInfo').html(data).modal('show');
	$('#editLink').button().click(RB.putRecipeInfo);
        return(false);  // prevent default link action
    },
    putRecipeInfo: function() {
        $.ajax({type: 'GET',
                url: $(this).attr('href'),
                timeout: 5000,
                success: RB.editRecipeInfo,
                error: function() { alert('Error!'); }
               });
        return(false);
    },
    editRecipeInfo: function(data) {
        $('#recipeInfo').modal('hide');
        $('#editrecipeInfo').html(data).modal().modal('show');
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
