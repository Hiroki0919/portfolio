class GuestSessionsController < ApplicationController
  #password→password

  def create
    user = User.find_by(email: 'test@example.com')
    session[:user_id] = user.id
    flash[:success] = 'ゲストユーザーでログインしました'
    redirect_to root_path
  end
end
