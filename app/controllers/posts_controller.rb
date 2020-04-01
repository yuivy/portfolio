class PostsController < ApplicationController
  
  before_action :authenticate_user
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    # ユーザー情報をuserテーブルから取得しshow.html.erb内で表示する
  end
  
  def new
    @post = Post.new
    @user = @post.user
  end
  
  def create
    @post = Post.new(
    content: params[:content],
    user_id: @current_user.id
    # 新規投稿をログインユーザーに紐付け
    )
    if @post.save
      flash[:notice]="投稿に成功しました"
      redirect_to("/posts/index")
    else
      render("/posts/new")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
        flash[:notice]="編集に成功しました"
        # 変数flash
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    #   renderメソッドをつけることで直前の投稿を表示できる
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
end