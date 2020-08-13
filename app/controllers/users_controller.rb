class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new(flash[:user])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10)
  end


  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      flash[:success] = "登録しました"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "編集しました"
      redirect_to root_path
    else
      render'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :age, :job, :area, :intro)
    end
end
