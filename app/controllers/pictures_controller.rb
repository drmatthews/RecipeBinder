class PicturesController < ApplicationController
  before_filter :signed_in_user
  before_filter :load_recipe
  
  def index
    @pictures = Picture.all
  end
  
  def new
    @view = params[:view]
    session[:view] = @view
    @recipe = Recipe.find(params[:recipe_id])
    @picture = @recipe.build_picture
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def create
    @view = session[:view]
    @recipe = Recipe.find(params[:recipe_id])
    @picture = @recipe.build_picture(params[:picture])
    respond_to do |format|
      if @picture.save
        format.js
        format.html { redirect_to recipes_path, notice: "Image was uploaded."  }
      else
        format.html { render :new }
      end
    end     
  end
  
private

  def load_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end  
end