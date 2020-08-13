class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = @posts.page(params[:page]).per(10)
  end

  def new 
    @post=Post.new(flash[:post])
  end

  def create
    @post = @current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    if @current_user.nil?
      flash.now[:danger] = "ログインして下さい"
      render 'sessions/new'
    else
      @comment = Comment.new(post_id: @post.id, user_id: @post.user.id)
      @like = Like.new
      @feel = Feel.new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "編集しました"
      redirect_to @post
    else
      render 'posts/edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "削除しました"
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, tag_ids:[])
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
