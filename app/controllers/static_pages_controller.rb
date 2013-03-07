class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @recipe  = current_user.recipes.build
      @recipes = current_user.recipes.paginate(page: params[:page])
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
