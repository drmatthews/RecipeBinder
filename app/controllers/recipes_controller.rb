class RecipesController < ApplicationController
  before_filter :signed_in_user
  respond_to :html, :js
  
  def index
    #@recipes = Recipe.paginate(:page => params[:page], :per_page => 15)
    @tag = Tag.find_by_name(params[:tag]) if params[:tag]
    if params[:search].blank?    
      @recipes = (@tag ? @tag.recipes : Recipe).all
    else
      @recipes = Recipe.text_search(params[:search])
    end
    #debugger
    @all_tags = Recipe.all_tags
    respond_to do |format|
      format.html { @recipes = @recipes.paginate(:page => params[:page], :per_page => 15) }
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
      respond_with(@recipe, :location => recipes_path)
    else
      render :action => 'new'
    end
  end

  def show
    #@user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.all
    @steps = @recipe.steps.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    #@user = User.find(params[:user_id])
    @recipe = current_user.recipes.find(params[:id])
    @ingredients = @recipe.ingredients.all
    @steps = @recipe.steps.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    respond_to do |format|
      if @recipe.update_attributes!(params[:recipe])
        format.html { redirect_to recipes_path, notice: "#{@recipe.title} was updated." }
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    flash[:sucess] = "Recipe successfully deleted"
    redirect_to user_path(current_user)
  end
end
