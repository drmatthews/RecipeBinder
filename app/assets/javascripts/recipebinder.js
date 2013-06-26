RB = {
    setup: function() {       
        $('<div id="recipeInfo" class="modal hide fade"></div>').
            hide().
            appendTo($('body'));   
        $('<div id="editrecipeInfo" class="modal hide fade"></div>').
            hide().
            appendTo($('body'));
        $('<div id="newRecipeModal" class="modal hide fade" tabindex="-1" data-width="760"></div>').
            hide().
            appendTo($('body'));
        $('<div id="list" class="modal hide fade"></div>').
            hide().
            appendTo($('body'));     
        $('<div id="recipeComments" class="modal hide fade"></div>').
            hide().
            appendTo($('body')); 
    }
}
$(RB.setup);       // when document ready, run setup code
