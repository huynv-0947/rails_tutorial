class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :load_micropost_by_current_user, only: :destroy

  def create
    @micropost = current_user.microposts.build micropost_params
    if @micropost.save
      flash[:success] = t "micropost_created_message"
      redirect_to root_url
    else
      @feed_items = []
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t "micropost_deleted"
    else
      flash[:danger] = t "micropost_deleted_failed"
    end
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit :content, :picture
  end

  def load_micropost_by_current_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    return if @micropost
    flash[:danger] = t "micropost_not_correct"
    redirect_to root_url
  end
end
