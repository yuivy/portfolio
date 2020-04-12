class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to("/posts/index")

    else
      flash[:danger] = "コメントできませんでした"
      render("/posts/show")
      # コメント入力viewに戻る
    end
  
  
  def edit
    @comment = Comment.find_by(id: params[:id])
  end
  
  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.content = params[:content]
    if @comment.save
      flash[:success] = "編集に成功しました"
      redirect_to("/posts/index")
    else
      flash[:danger] = "編集に失敗しました"
      render("/commets/edit")
    end
  end
    
    def destroy
      @comment = Comment.find_by(id: params[:id])
      @comment.destroy
      redirect_to("/posts/index")
    end
  end
  
  
  
  
  
  
  
  
  
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
