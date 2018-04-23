class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    logger.debug("unchi")
    post = Micropost.find(params[:micropost_id])
    current_user.favorite(post)
    flash[:success] = "お気に入りに登録しました"
    redirect_to root_url
  end

  def destroy
    post = Micropost.find(params[:micropost_id])
    current_user.unfavorite(post)
    flash[:success] = "お気に入りを解除しました"
    redirect_to root_url
  end
  
end