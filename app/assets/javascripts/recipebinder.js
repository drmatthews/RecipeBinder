/*RB = {
    setup: function() {
        // add invisible 'div' to end of page:
        //$('<div id="backgroundPopup"></div>').
        //    hide().
        //    appendTo($('body'));        
        $('<div id="recipeInfo"></div>').
            hide().
            appendTo($('body'));
        $('#recipes a').click(RB.getRecipeInfo);
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
        // center a floater 1/2 as wide and 1/4 as tall as screen
        var oneFourth = Math.ceil($(window).width() / 4);
        //$("#backgroundPopup").css({"opacity": "0.7"}).fadeIn("slow");
        $('#recipeInfo').
            html(data).
            css({'left': oneFourth,  'width': 2*oneFourth, 'top': 250}).
            fadeIn('slow').show();
        // make the Close link in the hidden element work
        $('#closeLink').click(RB.hideRecipeInfo);
        return(false);  // prevent default link action
    },
    hideRecipeInfo: function() {
        $('#recipeInfo').hide(); 
        return(false);
    }
}
$(RB.setup);       // when document ready, run setup code*/
RB= {
    setup: function() {
		$('#recipeModal').modal('hide');
        $('#recipes a').click(RB.getRecipeInfo);
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
        $('#recipeModal').
            html('<%= escape_javascript(render :partial => "recipes/recipe", :object => @recipe) %>').
            modal('show');
        // make the Close link in the hidden element work
        $('#closeLink').click(RB.hideRecipeInfo);
        return(false);  // prevent default link action
    },
    hideRecipeInfo: function() {
        $('#recipeInfo').modal('hide');
        return(false);
    }
	
}
$(RB.setup);
