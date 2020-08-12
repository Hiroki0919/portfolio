class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to root_path
    else
      flash[:danger] = "情報が一致しません"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] = "ログアウトしました"
    redirect_to root_path
  end
end
