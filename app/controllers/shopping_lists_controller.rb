class ShoppingListsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :show, :new]
  def index
    @user = User.find(params[:user_id])
    @lists = @user.shopping_lists.paginate(page: params[:page])
  end

  def new
    @user = User.find(params[:user_id])
    @list = @user.shopping_lists.build
  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.shopping_lists.build(params[:list])
   
    if @list.save
      flash[:success] = "New list added"
      redirect_to user_shopping_lists_path
    else
      render :action => 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @list = @user.shopping_lists.find(params[:id])
    @items = @list.shopping_list_items.all
    render :partial => 'list' if request .xhr?
  end

  def edit
    @user = User.find(params[:user_id])
    @list = @user.shopping_lists.find(params[:id])
    @items = @list.shopping_list_items.all
    render :partial => 'edit_list' if request .xhr?
  end

  def update
    @user = User.find(params[:user_id])
    @list = @user.shopping_lists.find(params[:id])
    @list.update_attributes!(params[:list])
    flash[:success] = "List successfully updated"
    redirect_to user_shopping_lists_path
  end

  def destroy
    @user = User.find(params[:user_id])
    @list = @user.shopping_lists.find(params[:id])
    @list.destroy
    flash[:sucess] = "Shopping list successfully deleted"
    redirect_to user_shopping_lists_path
  end
end
