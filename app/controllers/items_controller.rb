class ItemsController < ApplicationController
  before_filter :signed_in_user
  def index
    @items = Item.all
    render :partial => 'new' if request .xhr?
  end

  def new
    @item = Item.build
  end

  def create
    @item = Item.create!(params[:item])
    
    if @item.save
      redirect_to items_path
      render :partial => 'new' if request .xhr?
    else
      render :action => 'index'
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
    @item = Item.find(params[:id])
    @item.destroy
    flash[:sucess] = "Shopping list item successfully deleted"
    redirect_to items_path
  end
  
  def addto
    ingredients = Ingredient.find(params[:ingredient_ids])
    ingredients.each do |ingredient|
      @item = Item.create(:name => ingredient.content)
    end
    redirect_to items_path
  end

end
