class ListsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :show, :new]
  def index
    setup_list
  end

  def new
    @user = User.find(params[:user_id])
    @list = @user.lists.build
    3.times { @list.items.build } 
  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.build(params[:list])
   
    if @list.save
      flash[:success] = "New list added"
      redirect_to user_lists_path
    else
      render :action => 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:id])
    @items = @list.items.all
    render :partial => 'list' if request .xhr?
  end

  def edit
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:id])
    @items = @list.items.all
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
  
  private
  
    def setup_list
      @user = User.find(params[:user_id])
      @lists = @user.lists.paginate(page: params[:page])
    
      @list ||= List.new
    end
end
