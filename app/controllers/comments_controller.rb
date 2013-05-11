class CommentsController < ApplicationController
  before_filter :signed_in_user
  before_filter :load_recipe
  
  def index
    recipe = Recipe.find(params[:recipe_id])
    @comments = recipe.comments.all
    debugger
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    recipe = Recipe.find(params[:recipe_id])
    @comment = recipe.comments.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @comment = @recipe.comments.build(params[:comment])
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @recipe, notice: "Comment was created." }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @comment = current_user.comments.find(params[:id])
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @recipe, notice: "Comment was created." }
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @recipe, notice: "Comment was destroyed." }
      format.js
    end
  end

private

  def load_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end