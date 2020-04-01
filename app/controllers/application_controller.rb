class ApplicationController < ActionController::Base
  before_action :set_current_user
  # 「before_action :メソッド」でアクションの処理を共通化することができる
  
  def set_current_user
    # ログインしているユーザー
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    # アクセス制限のメソッド
    if @current_user == nil
      flash[:notice] = "ログインしてください"
      redirect_to("/login")
    end
  end
  
  def forbit_login_user
    # ログインユーザーがアクセスできない
    if @current_user
      flash[:notice] = "ログイン済みです"
      redirect_to("/posts/index")
    end
  end
end