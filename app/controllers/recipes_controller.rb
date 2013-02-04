class RecipesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :show, :new]
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.paginate(page: params[:page])
  end

  def new
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.build
    3.times { @recipe.ingredients.build } 
    3.times { @recipe.steps.build }  
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.build(params[:recipe])
   
    if @recipe.save
      flash[:success] = "New recipe added"
      redirect_to user_recipes_path
    else
      render :action => 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
    @ingredients = @recipe.ingredients.all
    @steps = @recipe.steps.all
  end

  def edit
  end

  def destroy
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy
    flash[:sucess] = "Recipe successfully deleted"
    redirect_to user_recipes_path
    debugger
  end
end
