class PicturesController < ApplicationController
  before_filter :signed_in_user
  before_filter :load_recipe
  
  def new
    recipe = Recipe.find(params[:recipe_id])
    @picture = recipe.build_picture
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def create
    @picture = @recipe.build_picture(params[:picture])
    respond_to do |format|
      if @picture.save
        format.html { redirect_to recipes_path }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end     
  end
  
private

  def load_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end  
end