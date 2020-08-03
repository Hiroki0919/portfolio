class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts=Post.page(params[:page])
  end

  def new 
    @post=Post.new(flash[:post])
  end

  def create
    post=Post.new(post_params)
    if post.save
      flash[:success] = "投稿しました"
      redirect_to root_path
    else
        render 'posts/new', flash:{
        post: post,
        error_messages: post.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(post_id: @post.id)
  end

  def edit
  end

  def update
    if @post.update
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
      params.require(:post).permit(:title, :content)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
