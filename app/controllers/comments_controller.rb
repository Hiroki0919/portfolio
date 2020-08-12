class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:success] = "コメントしました"
      redirect_to comment.post
    else
      flash[:danger] = "内容がないコメントは送信できません"
      redirect_back(fallback_location: post_path(id: comment.post.id))
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
