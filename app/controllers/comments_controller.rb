class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(comment_params)
    @comment.user_id = @current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to("/posts/index")

    else
      flash[:danger] = "コメントできませんでした"
      render()
      # コメント入力viewに戻る
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
