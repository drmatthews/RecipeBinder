class RecipesController < ApplicationController
  before_filter :signed_in_user, except: [:index, :show]
  respond_to :html, :js
  
  def index
    if params[:tag]
      selected_recipes = Recipe.tagged_with(params[:tag])
      @recipes = selected_recipes.paginate(page: params[:page], :per_page => 15)
    else
      @recipes = Recipe.paginate(page: params[:page], :per_page => 15)
    end
  end

  def new
    @recipe = current_user.recipes.build
    3.times { @recipe.ingredients.build } 
    3.times { @recipe.steps.build }
    respond_with(@recipe)   
  end

  def create
    @recipe = current_user.recipes.build(params[:recipe])
   
    if @recipe.save
      flash[:success] = "New recipe added"
      respond_with(@recipe)
    else
      render :action => 'new'
    end
  end

  def show
    #@user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.all
    @steps = @recipe.steps.all
    render :partial => 'recipe' if request .xhr?
  end

  def edit
    #@user = User.find(params[:user_id])
    @recipe = current_user.recipes.find(params[:id])
    @ingredients = @recipe.ingredients.all
    @steps = @recipe.steps.all
    render :partial => 'editmodal' if request .xhr?
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    @recipe.update_attributes!(params[:recipe])
    flash[:success] = "Recipe successfully updated"
    redirect_to user_path(current_user)
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    flash[:sucess] = "Recipe successfully deleted"
    redirect_to user_path(current_user)
  end
end
