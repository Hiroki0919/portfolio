class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new(flash[:user])
  end

  def show
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

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender, :age, :job, :area, :intro)
    end
end
