class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:success] = "コメントしました"
      redirect_to comment.post
    else
      render 'posts/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:danger] = "コメントを削除しました"
    redirect_to comment.post
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :comment)
    end
end
