class CommentsController < ApplicationController
  before_filter :signed_in_user
  before_filter :load_recipe
  
  def new
    @comment = Comment.new
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
    if @comment.update_attributes(params[:comment])
      redirect_to @recipe, notice: "Comment was updated."
    else
      render :edit
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