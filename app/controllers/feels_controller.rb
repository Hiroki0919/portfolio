class FeelsController < ApplicationController
  def create
    @like = current_user.feels.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Feel.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
