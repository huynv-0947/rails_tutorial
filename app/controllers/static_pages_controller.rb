class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @micropost  = current_user.microposts.build
    @feed_items = Micropost.feed(current_user.id).order_created_at.page(params[:page]).per Settings.POST_LIST_PER_PAGE
  end

  def help; end

  def about; end

  def contact; end
end
