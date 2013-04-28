class ItemsController < ApplicationController
  before_filter :signed_in_user
  def index
    @items = Item.all
    respond_to do |format|
      format.html { render @items }
      format.js
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create!(params[:item])
    respond_to do |format|
      format.html{ redirect_to items_path }
      format.js
    end   
  end

  def edit
    @item = Item.find(params[:id])
    @items = Item.all
    render :partial => 'edit_list' if request .xhr?
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes!(params[:item])
    flash[:success] = "List successfully updated"
    redirect_to items_path
  end

  def destroy
    @item = Item.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to items_url }
      format.js
    end
  end
  
  def addto
    ingredients = Ingredient.find(params[:ingredient_ids])
    ingredients.each do |ingredient|
      @item = Item.create(:name => ingredient.content)
    end
    redirect_to items_path
  end

end
